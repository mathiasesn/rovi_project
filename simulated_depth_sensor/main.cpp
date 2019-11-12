/* RoVi Final Project
 * Simulated Depth Sensor
 */

// INCLUDES
#include <iostream>
#include <chrono>
#include <pcl/io/pcd_io.h>
#include <pcl/point_types.h>
#include <pcl/filters/voxel_grid.h>
#include <pcl/filters/statistical_outlier_removal.h>
#include <pcl/filters/convolution_3d.h>
#include <pcl/kdtree/kdtree_flann.h>
#include <pcl/surface/mls.h>
#include <pcl/filters/passthrough.h>
#include <pcl/visualization/pcl_visualizer.h>
#include <pcl/search/kdtree.h>
#include <pcl/registration/transformation_estimation_svd.h>
#include <pcl/registration/transformation_estimation.h>
#include <pcl/registration/registration.h>
#include <pcl/features/normal_3d.h>
#include <pcl/features/spin_image.h>
#include <pcl/common/random.h>
#include <rw/rw.hpp>
#include <pcl/ModelCoefficients.h>
#include <pcl/sample_consensus/method_types.h>
#include <pcl/sample_consensus/model_types.h>
#include <pcl/segmentation/sac_segmentation.h>
#include <pcl/filters/extract_indices.h>

//---------------------------------------------------------

// DEFINES
#define MAX_ITERATIONS 10000
#define LEAF_SIZE 0.01
#define MEAN 200
#define STD_DEV 0.1
#define FILTER_LIMIT_MIN -1.5
#define FILTER_LIMIT_MAX -1.225
#define SMOOTHING_RADIUS 5
#define SPIN_IMAGES_RADIUS 0.05
#define ALIGNMENT_THRESHOLD 0.000025
#define THRESH_SQR 0.000025
#define SCENE_PATH "../Scanner25D.pcd"
#define OBJECT_PATH "../../point_clouds_of_objects/rubber_duck.pcd"
#define WC_FILE "../workcell/Scene.wc.xml"
#define SCANNER_FRAME "Scanner25D"

//---------------------------------------------------------

// TYPEDEFS
typedef pcl::PointNormal PointT;
typedef pcl::PointCloud<pcl::PointNormal> PointCloudT;
typedef pcl::Histogram<153> HistT;

//---------------------------------------------------------

// FUNCTIONS
/**
 * @brief showPointClouds
 * @param scene
 * @param object
 * @param view_name
 */
void showPointClouds(pcl::PointCloud<pcl::PointXYZ>::Ptr scene,
                     pcl::PointCloud<pcl::PointXYZ>::Ptr object,
                     const std::string &view_name) {
    pcl::visualization::PCLVisualizer::Ptr viewer(new pcl::visualization::PCLVisualizer(view_name));
    viewer->setBackgroundColor(0, 0, 0);
    pcl::visualization::PointCloudColorHandlerCustom<pcl::PointXYZ> color_g(scene, 0, 255, 0);
    pcl::visualization::PointCloudColorHandlerCustom<pcl::PointXYZ> color_r(object, 255, 0, 0);
    viewer->addPointCloud(scene, color_g, "Scene");
    viewer->addPointCloud(object, color_r, "Object");
    viewer->setPointCloudRenderingProperties(pcl::visualization::PCL_VISUALIZER_POINT_SIZE, 1, "Scene");
    viewer->setPointCloudRenderingProperties(pcl::visualization::PCL_VISUALIZER_POINT_SIZE, 1, "Object");
    viewer->initCameraParameters();
    viewer->setCameraClipDistances(0.244446, 0.824412);
    viewer->setCameraPosition(-0.0562254, -0.0666346, -0.529442, -0.00165773, -0.0633305, -0.167617, 0.982829, 0.108549, -0.149214);
    viewer->setPosition(662, 137);
    while (!viewer->wasStopped()) { viewer->spinOnce(100); }
    viewer->close();
}

/**
 * @brief voxelGrid
 * @param input_cloud
 * @param output_cloud
 */
void voxelGrid(PointCloudT::Ptr inputCloud,
               PointCloudT::Ptr &outputCloud,
               const float leafSize = 0.01) {
    pcl::VoxelGrid<PointT> voxelGrid;
    voxelGrid.setInputCloud(inputCloud);
    voxelGrid.setLeafSize(leafSize, leafSize, leafSize);
    voxelGrid.filter(*outputCloud);
}

/**
 * @brief outlierRemoval
 * @param input_cloud
 * @param output_clod
 */
void outlierRemoval(PointCloudT::Ptr inputCloud,
                    PointCloudT::Ptr &outputCloud) {
    pcl::StatisticalOutlierRemoval<PointT> statsOutlierRemoval;
    statsOutlierRemoval.setInputCloud(inputCloud);
    statsOutlierRemoval.setMeanK(MEAN);
    statsOutlierRemoval.setStddevMulThresh(STD_DEV);
    statsOutlierRemoval.filter(*outputCloud);
}

/**
 * @brief spatialFilter
 * @param input_cloud
 * @param output_cloud
 */
void spatialFilter(PointCloudT::Ptr inputCloud,
                   PointCloudT::Ptr &outputCloud) {
    pcl::PassThrough<PointT> spatialFilter;
    spatialFilter.setInputCloud(inputCloud);
    spatialFilter.setFilterFieldName("z");
    spatialFilter.setFilterLimits(FILTER_LIMIT_MIN, FILTER_LIMIT_MAX);
    spatialFilter.filter(*outputCloud);
}

/**
 * @brief smoothing
 * @param input_cloud
 * @param output_cloud
 */
void smoothing(PointCloudT::Ptr input_cloud,
               PointCloudT::Ptr &output_cloud) {
    // create a kd-tree
    pcl::search::KdTree<PointT>::Ptr tree(new pcl::search::KdTree<PointT>);
    pcl::PointCloud<PointT> mls_points;
    pcl::MovingLeastSquares<PointT, PointT> mls;

    // set parameters
    mls.setInputCloud(input_cloud);
    mls.setPolynomialOrder(2);
    mls.setSearchMethod(tree);
    mls.setSearchRadius(SMOOTHING_RADIUS);

    // reconstruct
    mls.process(mls_points);
    pcl::copyPointCloud(mls_points, *output_cloud);
}

/**
 * @brief planarSegmentation
 * @param inputCloud
 * @param outputCloud
 */
PointCloudT::Ptr planarSegmentation(PointCloudT::Ptr &cloud) {
    PointCloudT::Ptr result(new PointCloudT());
    pcl::ModelCoefficients::Ptr coeff(new pcl::ModelCoefficients());
    pcl::PointIndices::Ptr inliers(new pcl::PointIndices());
    // create the segmentation object
    pcl::SACSegmentation<PointT> seg;
    seg.setOptimizeCoefficients(true);
    seg.setModelType(pcl::SACMODEL_PLANE);
    seg.setMethodType(pcl::SAC_RANSAC);
    seg.setDistanceThreshold(0.01);
    seg.setInputCloud(cloud);
    seg.segment(*inliers, *coeff);
    if (inliers->indices.size() == 0) {
        PCL_ERROR("Cloud not estimate a planar model for the dataset.");
        return cloud;
    }
//    std::cerr << "Model inliers: " << inliers->indices.size () << std::endl;
//    for (std::size_t i = 0; i < inliers->indices.size (); ++i)
//        std::cerr << "Indices: " << inliers->indices[i]
//                  << "\tpoint: " << cloud->points[inliers->indices[i]].x << " "
//                                 << cloud->points[inliers->indices[i]].y << " "
//                                 << cloud->points[inliers->indices[i]].z << std::endl;
    // extract inliers
    pcl::ExtractIndices<PointT> extract;
    extract.setInputCloud(cloud);
    extract.setIndices(inliers);
    extract.setNegative(0.005f);
    extract.filter(*result);
    return result;
}

/**
 * @brief distSqr
 * @param query
 * @param target
 * @return
 */
float distSqr(const HistT &query, const HistT &target) {
    float result = 0.0;
    for (int i = 0; i < pcl::Histogram<153>::descriptorSize(); i++) {
        const float diff = reinterpret_cast<const float*>(&query)[i] - reinterpret_cast<const float*>(&target)[i];
        result += diff * diff;
    }
    return result;
}

/**
 * @brief nearestFeature
 * @param query
 * @param target
 * @param index
 * @param sqrDist
 */
void nearestFeature(const HistT &query,
                    const pcl::PointCloud<HistT> &target,
                    int &index,
                    float &sqrDist) {
    index = 0;
    sqrDist = distSqr(query, target[0]);
    for (size_t i = 0; i < target.size(); i++) {
        const float dist = distSqr(query, target[i]);
        if (dist < sqrDist) {
            index = i;
            sqrDist = dist;
        }
    }
}

/**
 * This function is from exercise 6 in the computer vision course.
 *
 * @brief estimateSurfaceNormal : Compute the surface normals using k=10 nearest
 *  neighbors around each point
 * @param cloud
 * @return
 */
PointCloudT::Ptr estimateSurfaceNormal(PointCloudT::Ptr cloud) {
    // create normal estimation
    pcl::NormalEstimation<PointT, PointT> normal_estimator;
    normal_estimator.setInputCloud(cloud);
    // creat KdTree
    pcl::search::KdTree<PointT>::Ptr tree(new pcl::search::KdTree<PointT>());
    normal_estimator.setSearchMethod(tree);
    // create result
    PointCloudT::Ptr result(new PointCloudT());
    // set search size and compute
    normal_estimator.setKSearch(10);
    normal_estimator.compute(*result);
    return result;
}

/**
 * This function is from exercise 6 in the computer vision course.
 *
 * @brief computeSpinImages : Compute local spin image features with r=5 surface
 *  description.
 * @param cloud
 * @param normals
 * @return
 */
pcl::PointCloud<HistT>::Ptr computeSpinImages(PointCloudT::Ptr cloud,
                                              PointCloudT::Ptr normals) {
    // setup spin image computation
    pcl::SpinImageEstimation<PointT, PointT, HistT> spin_image_descriptor(8, 0.5, 4);
    spin_image_descriptor.setInputCloud(cloud);
    spin_image_descriptor.setInputNormals(normals);
    // create KdTree
    pcl::search::KdTree<PointT>::Ptr tree(new pcl::search::KdTree<PointT>());
    spin_image_descriptor.setSearchMethod(tree);
    // Calculate spin images
    pcl::PointCloud<HistT>::Ptr spin_images(new pcl::PointCloud<HistT>());
    spin_image_descriptor.setRadiusSearch(SPIN_IMAGES_RADIUS);
    // compute the spin images
    spin_image_descriptor.compute(*spin_images);
    return spin_images;
}

/**
 * This functions is form exercise 6 in the computer vision course
 *
 * @brief calcL2Dist : compute the l2 distance between the two histograms
 * @param object : histogram of the object
 * @param scene : histogram of the scene
 * @return : l2 distance
 */
float computeL2Dist(const HistT &object,
                    const HistT &scene) {
    float result = 0.0;
    for (int i = 0; i < scene.descriptorSize(); i++) {
        result += std::sqrt(std::pow((scene.histogram[i] - object.histogram[i]), 2));
    }
    return result;
}

/**
 * This function is from exercise 6 in the computer vision course.
 *
 * @brief nearestMatchingFeature : find the nearest matching (k=1) scene feature
 *  for each object feature
 * @param scene : spin images of the scene point cloud
 * @param object : spin images of the object point cloud
 * @return :
 */
std::vector<int> nearestMatchingFeature(pcl::PointCloud<HistT>::Ptr scene,
                                        pcl::PointCloud<HistT>::Ptr object) {
    std::vector<int> result;
    for (size_t i = 0; i < object->points.size(); i++) {
        HistT object_histogram = object->points[i];
        float min_distance = std::numeric_limits<float>::max();
        int index = 0;
        for (size_t j = 0; j < scene->points.size(); j++) {
            HistT scene_histogram = scene->points[j];
            float distance = computeL2Dist(object_histogram, scene_histogram);
            if (distance < min_distance) {
                min_distance = distance;
                index = j;
            }
        }
        result.push_back(index);
    }
    return result;
}

/**
 * This function is from exercise 6 in the computer vision course.
 *
 * @brief findAlignment
 * @param scene
 * @param object
 * @param object2scene
 * @param &output
 * @return
 */
Eigen::Matrix4f findGlobalAlignment(PointCloudT::Ptr scene,
                                    PointCloudT::Ptr object) {
    // compute surface normals
    {
        pcl::NormalEstimation<PointT, PointT> normalEsitmator;
        normalEsitmator.setKSearch(10);
        // compute for object
        normalEsitmator.setInputCloud(object);
        normalEsitmator.compute(*object);
        // compute for scene
        normalEsitmator.setInputCloud(scene);
        normalEsitmator.compute(*scene);
    }

    // compute spin images
    pcl::PointCloud<HistT>::Ptr sceneFeatures(new pcl::PointCloud<HistT>());
    pcl::PointCloud<HistT>::Ptr objectFeatures(new pcl::PointCloud<HistT>());
    {
        pcl::SpinImageEstimation<PointT, PointT, HistT> spinEstimator;
        spinEstimator.setRadiusSearch(0.05);
        // object
        spinEstimator.setInputCloud(object);
        spinEstimator.setInputNormals(object);
        spinEstimator.compute(*objectFeatures);
        // scene
        spinEstimator.setInputCloud(scene);
        spinEstimator.setInputNormals(scene);
        spinEstimator.compute(*sceneFeatures);
    }

    // find feature matches
    pcl::Correspondences correspondences(objectFeatures->size());
    {
        for (size_t i = 0; i < objectFeatures->size(); i++) {
            correspondences[i].index_query = i;
            nearestFeature(objectFeatures->points[i], *sceneFeatures, correspondences[i].index_match, correspondences[i].distance);
        }
    }

    // show matches
    {
        pcl::visualization::PCLVisualizer view("Scene before preprocessing");
        view.addPointCloud<PointT>(object, pcl::visualization::PointCloudColorHandlerCustom<PointT>(object, 255, 0, 0),"object");
        view.addPointCloud<PointT>(scene, pcl::visualization::PointCloudColorHandlerCustom<PointT>(scene, 0, 255, 0),"scene");
        view.addCorrespondences<PointT>(object, scene, correspondences, 1);
        view.spin();
    }

    // create a kd-tree for scene
    pcl::search::KdTree<PointT> tree;
    tree.setInputCloud(scene);

    // start RANSAC
    Eigen::Matrix4f result = Eigen::Matrix4f::Identity();
    PointCloudT::Ptr objectAligned(new PointCloudT());
    float penalty = FLT_MAX;
    {
        std::cout << "Starting RANSAC.." << std::endl;
        auto timeStart = std::chrono::high_resolution_clock::now();
        pcl::common::UniformGenerator<int> gen(0, correspondences.size()-1);
        for (size_t i = 0; i < 5000; i++) {
            if ((i +1) % 250 == 0) { std::cout << "\t" << i+1 << std::endl; }
            // sample 3 random correspondeces
            std::vector<int> idxObject(3), idxScene(3);
            for (int j = 0; j < 3; j++) {
                const int idx = gen.run();
                idxObject[j] = correspondences[idx].index_query;
                idxScene[j] = correspondences[idx].index_match;
            }
            // esitmate transformation
            Eigen::Matrix4f T;
            pcl::registration::TransformationEstimationSVD<PointT, PointT> svd;
            svd.estimateRigidTransformation(*object, idxObject, *scene, idxScene, T);
            // apply pose
            pcl::transformPointCloud(*object, *objectAligned, T);
            // validate by computing inliers and RMSE
            std::vector<std::vector<int>> idx;
            std::vector<std::vector<float>> sqrDist;
            tree.nearestKSearch(*objectAligned, std::vector<int>(), 1, idx, sqrDist);
            size_t inliers = 0;
            float rmse = 0.0;
            for (size_t j = 0; j < sqrDist.size(); j++) {
                if (sqrDist[j][0] <= THRESH_SQR) {
                    inliers++;
                    rmse += sqrDist[j][0];
                }
            }
            rmse = std::sqrt(rmse / inliers);
            // evaluate penalty function
            const float outlierRate = 1.0f - float(inliers) / object->size();
            if (outlierRate < penalty) {
                std::cout << "\t--> Got a new model with " << inliers << " inliers!" << std::endl;
                penalty = outlierRate;
                result = T;
            }
        }
        // compute inliers and RMSE
        std::vector<std::vector<int>> idx;
        std::vector<std::vector<float>> sqrDist;
        tree.nearestKSearch(*objectAligned, std::vector<int>(), 1, idx, sqrDist);
        size_t inliers = 0;
        float rmse = 0.0;
        for (size_t j = 0; j < sqrDist.size(); j++) {
            if (sqrDist[j][0] <= THRESH_SQR) {
                inliers++;
                rmse += sqrDist[j][0];
            }
        }
        // print timing
        auto timeEnd = std::chrono::high_resolution_clock::now();
        auto time = std::chrono::duration_cast<std::chrono::seconds>(timeEnd - timeStart);
        std::cout << "\nExecution time for local alignment => " << time.count() << " s" << std::endl;
        // print pose
        std::cout << "Got the following pose:\n" << result << std::endl;
        std::cout << "Inliers: " << inliers << std::endl;
        std::cout << "RMSE: " << rmse << std::endl;
        return result;
    }

//    pcl::common::UniformGenerator<int> uniform_generator(0, object2scene.size()-1);
//    pcl::PointCloud<pcl::PointXYZ>::Ptr object_transform(new pcl::PointCloud<pcl::PointXYZ>());
//    pcl::PointCloud<pcl::PointXYZ>::Ptr object_points(new pcl::PointCloud<pcl::PointXYZ>());
//    pcl::PointCloud<pcl::PointXYZ>::Ptr scene_points(new pcl::PointCloud<pcl::PointXYZ>());
//    pcl::registration::TransformationEstimationSVD<pcl::PointXYZ, pcl::PointXYZ> estimate_svd;
//    pcl::registration::TransformationEstimationSVD<pcl::PointXYZ, pcl::PointXYZ>::Matrix4 transform;
//    pcl::registration::TransformationEstimationSVD<pcl::PointXYZ, pcl::PointXYZ>::Matrix4 best_transform;

//    pcl::search::KdTree<pcl::PointXYZ> tree;
//    tree.setInputCloud(scene);

//    object_points->width = 3;
//    object_points->height = 1;
//    object_points->is_dense = false;
//    object_points->resize(object_points->height * object_points->width);
//    scene_points->width = 3;
//    scene_points->height = 1;
//    scene_points->is_dense = false;
//    scene_points->resize(scene_points->height * scene_points->width);

//    int max_inliers = 0;
//    unsigned int k = 1;
//    std::vector<int> k_indices(k);
//    std::vector<float> k_squared_dist(k);
//    auto time_start = std::chrono::high_resolution_clock::now();
//    for (unsigned int i = 0; i < MAX_ITERATIONS; i++) {
//        for (unsigned int j = 0; j < 3; j++) {
//            int random_int = uniform_generator.run();
//            object_points->points[j] = object->points[random_int];
//            scene_points->points[j] = scene->points[object2scene[random_int]];
//        }
//        estimate_svd.estimateRigidTransformation(*object_points, *scene_points, transform);
//        pcl::transformPointCloud(*object, *object_transform, transform);
//        int inliers = 0;
//        for (unsigned int j = 0; j < object_transform->points.size(); j++) {
//            tree.nearestKSearch(object_transform->points[j], k, k_indices, k_squared_dist);
//            if (k_squared_dist[0] < ALIGNMENT_THRESHOLD) { inliers++; }
//        }
//        if (inliers > max_inliers) {
//            max_inliers = inliers;
//            best_transform = transform;
//            std::cout << "New model => inlers = " << max_inliers << std::endl;
//        }
//        if (i % 1000 == 0) { std::cout << i << " / " << MAX_ITERATIONS << std::endl; }
//    }
//    auto time_end = std::chrono::high_resolution_clock::now();
//    auto time = std::chrono::duration_cast<std::chrono::seconds>(time_end - time_start);
//    std::cout << "\nExecution time of global alignment => " << time.count() << " s" << std::endl;
//    output = best_transform;
}

/**
 * This function is from exercise 6 in the computer vision course.
 *
 * @brief findLocalAlignment : implements ICP for bringing the models
 *  into accurate alignment
 * @param scene : scene point cloud
 * @param object : object point cloud
 * @param &output : estimated transformation
 */
Eigen::Matrix4f findLocalAlignment(PointCloudT::Ptr scene,
                                   PointCloudT::Ptr object) {
    Eigen::Matrix4f result = Eigen::Matrix4f::Identity();
    pcl::search::KdTree<PointT> tree;
    tree.setInputCloud(scene);
    PointCloudT::Ptr objectAligned(new PointCloudT(*object));
    std::cout << "Starting ICP.." << std::endl;
    auto timeStart = std::chrono::high_resolution_clock::now();
    for (size_t i = 0; i < 50; i++) {
        // find the closest points
        std::vector<std::vector<int>> indexs;
        std::vector<std::vector<float>> sqrDists;
        tree.nearestKSearch(*objectAligned, std::vector<int>(), 1, indexs, sqrDists);
        //
        std::vector<int> idxObject, idxScene;
        for (size_t j = 0; j < indexs.size(); j++) {
            if (sqrDists[j][0] <= THRESH_SQR) {
                idxObject.push_back(j);
                idxScene.push_back(indexs[j][0]);
            }
        }
        // estimate transformation
        Eigen::Matrix4f T;
        pcl::registration::TransformationEstimationSVD<PointT, PointT> svd;
        svd.estimateRigidTransformation(*objectAligned, idxObject, *scene, idxScene, T);
        // apply pose
        pcl::transformPointCloud(*objectAligned, *objectAligned, T);
        // update result
        result = T * result;
    }
    // compute inliers and RMSE
    std::vector<std::vector<int>> indexs;
    std::vector<std::vector<float>> sqrDists;
    tree.nearestKSearch(*objectAligned, std::vector<int>(), 1, indexs, sqrDists);
    size_t inliers = 0;
    float rmse = 0.0;
    for (size_t i = 0; i < sqrDists.size(); i++) {
        if (sqrDists[i][0] <= THRESH_SQR) {
            ++inliers;
            rmse += sqrDists[i][0];
        }
    }
    rmse = std::sqrt(rmse / inliers);
    // print timing
    auto timeEnd = std::chrono::high_resolution_clock::now();
    auto time = std::chrono::duration_cast<std::chrono::seconds>(timeEnd - timeStart);
    std::cout << "\nExecution time for local alignment => " << time.count() << " s" << std::endl;
    // print pose
    std::cout << "Got the following pose:\n" << result << std::endl;
    std::cout << "Inliers: " << inliers << std::endl;
    std::cout << "RMSE: " << rmse << std::endl;
    return result;

//    // for each object point p, find the nearest scene point q
//    pcl::search::KdTree<pcl::PointXYZ> kdTree;
//    kdTree.setInputCloud(scene);
//    int k = 1;
//    std::vector<int> kIndices(k);
//    std::vector<float> kSqrDist(k);
//    std::vector<int> sceneIdx, objectIdx;
//    auto timeStart = std::chrono::high_resolution_clock::now();
//    for (unsigned int i = 0; i < object->points.size(); i++) {
//        pcl::PointXYZ searchPoint = object->points[i];
//        //int nearestNeighbor = kdTree.nearestKSearch(searchPoint, k, kIndices, kSqrDist);
//        kdTree.nearestKSearch(searchPoint, k, kIndices, kSqrDist);
//        if (kSqrDist[0] < ALIGNMENT_THRESHOLD) {
//            sceneIdx.push_back(kIndices[0]);
//            objectIdx.push_back(i);
//        }
//    }
//    // use all (p, q) pairs to estiamte T using the Kabsch algorithm
//    pcl::registration::TransformationEstimationSVD<pcl::PointXYZ, pcl::PointXYZ> svd;
//    svd.estimateRigidTransformation(*object, objectIdx, *scene, sceneIdx, output);
//    auto timeEnd = std::chrono::high_resolution_clock::now();
//    auto time = std::chrono::duration_cast<std::chrono::seconds>(timeEnd - timeStart);
//    std::cout << "\nExecution time for local alignment => " << time.count() << " s" << std::endl;
}

/**
 * @brief getFrameTransform
 * @param frame_name
 * @param output
 */
int getFrameTransform(const std::string frameName, rw::math::Transform3D<> &output) {
    rw::models::WorkCell::Ptr wc = rw::loaders::WorkCellLoader::Factory::load(WC_FILE);
    rw::kinematics::State state = wc->getDefaultState();
    rw::kinematics::Frame *objectFrame = wc->findFrame(frameName);
    if (objectFrame == NULL) {
        std::cerr << frameName << " not found!" << std::endl;
        return-1;
    }
    rw::kinematics::Frame *scannerFrame = wc->findFrame("Scanner25D");
    if (scannerFrame == NULL) {
        std::cerr << "Scanner25D frame not found!" << std::endl;
        return -1;
    }
    rw::kinematics::Frame *tableFrame = wc->findFrame("Table");
    if (tableFrame == NULL) {
        std::cerr << "Table frame not found!" << std::endl;
        return -1;
    }
    rw::kinematics::Frame *worldFrame = wc->findFrame("WORLD");
    if (worldFrame == NULL) {
        std::cerr << "WORLD frame not found!" << std::endl;
        return -1;
    }
    rw::math::Transform3D<> objectTransform = objectFrame->getTransform(state);
    rw::math::Transform3D<> scannerTransform = scannerFrame->getTransform(state);
    rw::math::Transform3D<> tableTransform = tableFrame->getTransform(state);
    rw::math::Transform3D<> worldTransform = worldFrame->getTransform(state);
    output = scannerTransform * worldTransform * tableTransform * objectTransform;
    return 0;
}

/**
 * @brief convertTransform3D2Matrix4
 * @param frame
 * @param input
 * @param output
 * @return
 */
int convertTransform3D2Matrix4(const std::string &frameName,
                               const rw::math::Transform3D<> &input,
                               pcl::registration::TransformationEstimationSVD<pcl::PointXYZ, pcl::PointXYZ>::Matrix4 &output) {
    // get frame transform
    rw::models::WorkCell::Ptr wc = rw::loaders::WorkCellLoader::Factory::load(WC_FILE);
    rw::kinematics::State state = wc->getDefaultState();
    rw::kinematics::Frame *objectFrame = wc->findFrame(frameName);
    if (objectFrame == NULL) {
        std::cerr << frameName << " not found!" << std::endl;
        return-1;
    }
    rw::math::Transform3D<> objectTransform = objectFrame->getTransform(state);
    // convert to matrix4

    return 0;
}
//---------------------------------------------------------

// Main
int main(int argc, char** argv) {
    std::cout << "\nProgram started\n" << std::endl;

    //---------------------------
    // POINT CLOUD PREPROCESSING
    //---------------------------
    std::cout << "Point cloud preprocessing" << std::endl;

    // load the point cloud
    PointCloudT::Ptr scene(new PointCloudT);
    pcl::io::loadPCDFile(SCENE_PATH, *scene);

    // show point cloud
    {
        pcl::visualization::PCLVisualizer view("Scene before preprocessing");
        view.addPointCloud<PointT>(scene, pcl::visualization::PointCloudColorHandlerCustom<PointT>(scene, 0, 255, 0),"scene");
        view.spin();
    }

    // display point cloud info
    std::cout << "Point cloud before preprocessing => " << std::endl;
    PointT min_pt, max_pt;
    pcl::getMinMax3D(*scene, min_pt, max_pt);
    std::cout << "Max x: " << max_pt.x << std::endl;
    std::cout << "Max y: " << max_pt.y << std::endl;
    std::cout << "Max z: " << max_pt.z << std::endl;
    std::cout << "Min x: " << min_pt.x << std::endl;
    std::cout << "Min y: " << min_pt.y << std::endl;
    std::cout << "Min z: " << min_pt.z << std::endl;
    std::cerr << scene->width * scene->height
              << " data points ("
              << pcl::getFieldsList(*scene)
              << ")."
              << std::endl;

    // filter point cloud
    voxelGrid(scene, scene);
    std::cerr << "PointCloud after voxel grid: "
              << scene->width * scene->height
              << " data points ("
              << pcl::getFieldsList(*scene)
              << ")."
              << std::endl;

//    outlierRemoval(scene, scene);
//    std::cerr << "PointCloud after outlier removal filter: "
//              << scene->width * scene->height
//              << " data points ("
//              << pcl::getFieldsList(*scene)
//              << ")."
//              << std::endl;

    spatialFilter(scene, scene);
    std::cerr << "PointCloud after spatial filter: "
              << scene->width * scene->height
              << " data points ("
              << pcl::getFieldsList(*scene)
              << ")."
              << std::endl;

//    smoothing(scene, scene);
//    std::cerr << "PointCloud after spatial smoothing: "
//              << scene->width * scene->height
//              << " data points ("
//              << pcl::getFieldsList(*scene)
//              << ")."
//              << std::endl;

    // remove plans in the scene
    scene = planarSegmentation(scene);
    scene = planarSegmentation(scene);
    scene = planarSegmentation(scene);
    scene = planarSegmentation(scene);
    scene = planarSegmentation(scene);

    // save the new point cloud
    pcl::PCDWriter writer;
    writer.write<PointT>("../cloud_filtered.pcd", *scene, false);

    //---------------------------
    // POSE ESTIMATION 3D TO 3D
    //---------------------------
    std::cout << "Pose estimation 3D to 3D" << std::endl;

    // load the generated object point cloud
    PointCloudT::Ptr object(new PointCloudT);
    pcl::io::loadPCDFile(OBJECT_PATH, *object);

    // display point cloud info
    std::cout << "Object point cloud before preprocessing => " << std::endl;
    PointT minPt, maxPt;
    pcl::getMinMax3D(*object, minPt, maxPt);
    std::cout << "Max x: " << maxPt.x << std::endl;
    std::cout << "Max y: " << maxPt.y << std::endl;
    std::cout << "Max z: " << maxPt.z << std::endl;
    std::cout << "Min x: " << minPt.x << std::endl;
    std::cout << "Min y: " << minPt.y << std::endl;
    std::cout << "Min z: " << minPt.z << std::endl;
    std::cerr << object->width * object->height
              << " data points ("
              << pcl::getFieldsList(*object)
              << ")."
              << std::endl;

    // filter object point cloud
    voxelGrid(object, object, 0.0011);
    std::cerr << "object point cloud after voxel grid: "
              << object->width * object->height
              << " data points ("
              << pcl::getFieldsList(*object)
              << ")."
              << std::endl;

    // show intial state of scene and object
    {
        pcl::visualization::PCLVisualizer view("Scene before preprocessing");
        view.addPointCloud<PointT>(object, pcl::visualization::PointCloudColorHandlerCustom<PointT>(object, 255, 0, 0),"object");
        view.addPointCloud<PointT>(scene, pcl::visualization::PointCloudColorHandlerCustom<PointT>(scene, 0, 255, 0),"scene");
        view.spin();
    }

    //---------------------------
    // GLOBAL ALIGNMENT
    //---------------------------
    std::cout << "Global alignment.." << std::endl;

    // find alignment
    Eigen::Matrix4f poseGlobal = findGlobalAlignment(scene, object);
    pcl::transformPointCloud(*object, *object, poseGlobal);
    std::cout << "Found transform after global alignment =>\n" << poseGlobal << std::endl;
    // show the state of the scene and the object
    {
        pcl::visualization::PCLVisualizer view("After global alignment");
        view.addPointCloud<PointT>(object, pcl::visualization::PointCloudColorHandlerCustom<PointT>(object, 255, 0, 0),"object");
        view.addPointCloud<PointT>(scene, pcl::visualization::PointCloudColorHandlerCustom<PointT>(scene, 0, 255, 0),"scene");
        view.spin();
    }

    //-----------------
    // LOCAL ALIGNMENT
    //-----------------
    std::cout << "Local alignment.." << std::endl;
    Eigen::Matrix4f poseLocal = findLocalAlignment(scene, object);
    pcl::transformPointCloud(*object, *object, poseLocal);
    std::cout << "Found transform after local alignment =>\n" << poseLocal * poseGlobal << std::endl;
    // show the state of the scene and the object
    {
        pcl::visualization::PCLVisualizer view("After local alignment");
        view.addPointCloud<PointT>(object, pcl::visualization::PointCloudColorHandlerCustom<PointT>(object, 255, 0, 0),"object");
        view.addPointCloud<PointT>(scene, pcl::visualization::PointCloudColorHandlerCustom<PointT>(scene, 0, 255, 0),"scene");
        view.spin();
    }

    // Real transform from the camera
    rw::math::Transform3D<> wcTransform;
    if (getFrameTransform("RubberDuck", wcTransform) != 0) { return -1; }
    std::cout << "Real transform =>\n" << wcTransform.P() << "\n" << wcTransform.R() << std::endl;

    std::cout << "\nProgram ended\n" << std::endl;
    return 0;
}
//---------------------------------------------------------
