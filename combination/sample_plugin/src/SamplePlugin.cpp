#include "vision.hpp"
#include "SamplePlugin.hpp"
#include "util.hpp"
#include "robotics.hpp"

//#define WC_FILE "/home/mathi/Documents/rovi/rovi_project/simulated_depth_sensor/workcell/Scene.wc.xml"
#define WC_FILE "combination/workcell/Scene.wc.xml"

SamplePlugin::SamplePlugin():RobWorkStudioPlugin("SamplePluginUI", QIcon(":/pa_icon.png")) {
	setupUi(this);

	_timer = new QTimer(this);
    connect(_timer, SIGNAL(timeout()), this, SLOT(timer()));

	// now connect stuff from the ui component
    connect(_btn_pose,       SIGNAL(pressed()),         this, SLOT(btnPressed()) );
    connect(_btn_move,       SIGNAL(pressed()),         this, SLOT(btnPressed()) );
    connect(_btn_home,       SIGNAL(pressed()),         this, SLOT(btnPressed()) );
    connect(_btn_obj,        SIGNAL(pressed()),         this, SLOT(btnPressed()) );
    connect(_btn_goal,       SIGNAL(pressed()),         this, SLOT(btnPressed()) );

    connect(_btn_im,         SIGNAL(pressed()),         this, SLOT(btnPressed()) );
    connect(_btn_scan,       SIGNAL(pressed()),         this, SLOT(btnPressed()) );

//    connect(_btn0,           SIGNAL(pressed()),         this, SLOT(btnPressed()) );
//    connect(_btn1,           SIGNAL(pressed()),         this, SLOT(btnPressed()) );

    connect(_spinBox,        SIGNAL(valueChanged(int)), this, SLOT(btnPressed()) );

	_framegrabber = NULL;
	
	_cameras = {"Camera_Right", "Camera_Left"};
	_cameras25D = {"Scanner25D"};
}

SamplePlugin::~SamplePlugin() {
    delete _textureRender;
    delete _bgRender;
}

void SamplePlugin::initialize() {
	log().info() << "INITALIZE" << "\n";

    getRobWorkStudio()->stateChangedEvent().add(std::bind(&SamplePlugin::stateChangedListener, this, std::placeholders::_1), this);

	// Auto load workcell
    rw::models::WorkCell::Ptr wc = rw::loaders::WorkCellLoader::Factory::load(WC_FILE);
	getRobWorkStudio()->setWorkCell(wc);

}

void SamplePlugin::open(rw::models::WorkCell* workcell)
{
    log().info() << "OPEN" << "\n";
    _wc = workcell;
    _state = _wc->getDefaultState();

    log().info() << workcell->getFilename() << "\n";

    if (_wc != NULL) {
	// Add the texture render to this workcell if there is a frame for texture
    rw::kinematics::Frame* textureFrame = _wc->findFrame("MarkerTexture");
	if (textureFrame != NULL) {
		getRobWorkStudio()->getWorkCellScene()->addRender("TextureImage",_textureRender,textureFrame);
	}
	// Add the background render to this workcell if there is a frame for texture
    rw::kinematics::Frame* bgFrame = _wc->findFrame("Background");
	if (bgFrame != NULL) {
		getRobWorkStudio()->getWorkCellScene()->addRender("BackgroundImage",_bgRender,bgFrame);
	}

	// Create a GLFrameGrabber if there is a camera frame with a Camera property set
    rw::kinematics::Frame* cameraFrame = _wc->findFrame(_cameras[0]);
	if (cameraFrame != NULL) {
		if (cameraFrame->getPropertyMap().has("Camera")) {
			// Read the dimensions and field of view
			double fovy;
            int width, height;
			std::string camParam = cameraFrame->getPropertyMap().get<std::string>("Camera");
			std::istringstream iss (camParam, std::istringstream::in);
			iss >> fovy >> width >> height;
			// Create a frame grabber
            _framegrabber = new rwlibs::simulation::GLFrameGrabber(width,height,fovy);
            rw::graphics::SceneViewer::Ptr gldrawer = getRobWorkStudio()->getView()->getSceneViewer();
			_framegrabber->init(gldrawer);
		}
	}
	
    rw::kinematics::Frame* cameraFrame25D = _wc->findFrame(_cameras25D[0]);
	if (cameraFrame25D != NULL) {
		if (cameraFrame25D->getPropertyMap().has("Scanner25D")) {
			// Read the dimensions and field of view
			double fovy;
			int width,height;
			std::string camParam = cameraFrame25D->getPropertyMap().get<std::string>("Scanner25D");
			std::istringstream iss (camParam, std::istringstream::in);
			iss >> fovy >> width >> height;
			// Create a frame grabber
            _framegrabber25D = new rwlibs::simulation::GLFrameGrabber25D(width,height,fovy);
            rw::graphics::SceneViewer::Ptr gldrawer = getRobWorkStudio()->getView()->getSceneViewer();
			_framegrabber25D->init(gldrawer);
		}
	}

    _device = _wc->findDevice<rw::models::SerialDevice>("UR-6-85-5-A");
    _step = -1;
	
    }
}


void SamplePlugin::close() {
    log().info() << "CLOSE" << "\n";

    // Stop the timer
    _timer->stop();
    // Remove the texture render
    rw::kinematics::Frame* textureFrame = _wc->findFrame("MarkerTexture");
	if (textureFrame != NULL) {
		getRobWorkStudio()->getWorkCellScene()->removeDrawable("TextureImage",textureFrame);
	}
	// Remove the background render
    rw::kinematics::Frame* bgFrame = _wc->findFrame("Background");
	if (bgFrame != NULL) {
		getRobWorkStudio()->getWorkCellScene()->removeDrawable("BackgroundImage",bgFrame);
	}
	// Delete the old framegrabber
	if (_framegrabber != NULL) {
		delete _framegrabber;
	}
	_framegrabber = NULL;
	_wc = NULL;
}

cv::Mat SamplePlugin::toOpenCVImage(const rw::sensor::Image& img) {
    cv::Mat res(img.getHeight(),img.getWidth(), CV_8SC3);
	res.data = (uchar*)img.getImageData();
	return res;
}


void SamplePlugin::btnPressed() {
    QObject *obj = sender();
//    if ( obj==_btn0 ){
////		log().info() << "Button 0\n";
////		// Toggle the timer on and off
////		if (!_timer25D->isActive())
////		    _timer25D->start(100); // run 10 Hz
////		else
////			_timer25D->stop();
//        _timer->stop();
//        rw::math::Math::seed();
//        double extend = 0.05;
//        double maxTime = 60;
//        rw::math::Q from(6, 1.571, -1.572, -1.572, -1.572, 1.571, 0);
//        rw::math::Q to(6, 1.847, -2.465, -1.602, -0.647, 1.571, 0); //From pose estimation
//        createPathRRTConnect(from, to, extend, maxTime);
//    }
//    else if(obj==_btn1) {
//        log().info() << "Button 1\n";
//        // Toggle the timer on and off
//        if (!_timer->isActive()){
//            _timer->start(100); // run 10 Hz
//            _step = 0;
//        }
//        else
//            _step = 0;
//    }
    if(obj==_spinBox) {
		log().info() << "spin value:" << _spinBox->value() << "\n";
	}
    else if( obj==_btn_im ) {
		getImage();
	}
    else if (obj == _btn_scan) {
        get25DImage();
    }
    else if (obj == _btn_move) {
        moveFrameRandom(_wc, _state, "Duck");
        getRobWorkStudio()->setState(_state);
    }
    else if (obj == _btn_pose) {
        // get real pose
        MovFrame *frame = _wc->findFrame<MovFrame>("Duck");
        Pose realPose = frame->getTransform(_state);

        // create pcd file
        get25DImage();

        // perform alignment
        Eigen::Matrix4f poseMatrix = Eigen::Matrix4f::Identity();
        {
            pcl::ScopeTime t("Alignment time");
            poseMatrix = alignment();
        }

        // show the alignment in origin scene
        {
            PointCloudT::Ptr _scene(new PointCloudT);
            PointCloudT::Ptr _object(new PointCloudT);

            pcl::io::loadPCDFile("Scanner25D.pcd", *_scene);
            spatialFilter(_scene, _scene);
            voxelGrid(_scene, _scene);

            pcl::io::loadPCDFile(OBJECT_PATH, *_object);
            voxelGrid(_object, _object, 0.005f);
            pcl::transformPointCloud(*_object, *_object, poseMatrix);

            pcl::visualization::PCLVisualizer view("After alignment");
            view.addPointCloud<PointT>(_object, ColorHandlerT(_object, 255, 0 , 0), "Object");
            view.addPointCloud<PointT>(_scene, ColorHandlerT(_scene, 0, 255, 0), "Scene");
            view.spin();
        }

        // calculate error
        Pose estimatedPose = matrix2Transform(poseMatrix);
        //std::pair<float, float> diffs = calcError(_wc, _state, estimatedPose, realPose);
        estimatedPose = calcError(_wc, _state, estimatedPose, realPose);

        // get configurations for device grasp of object
        _objQ = getGraspQ(estimatedPose);
        getAboveGraspQ(estimatedPose);

        getRobWorkStudio()->setState(_state);
    }
    else if (obj == _btn_obj) {
        std::cout << "\nMove robot tcp to object.." << std::endl;

        _timer->stop();
        std::vector<Q> qs;

//        // calc path rrt
//        std::cout << "\nCalculating path.." << std::endl;
//        rw::math::Math::seed();
//        double extend = 0.6;
//        double maxTime = 60;
//        createPathRRTConnect(_homeQ, _objQ, extend, maxTime);
//        std::cout << "\nPath length --> " << _path.size() << std::endl;
//        for (std::size_t i = 0; i < _path.size(); i++) {
//            qs.push_back(_path[i]);
//            std::cout << "Configuration " << i << " --> " << qs[i] << std::endl;
//        }

        qs = parabolicBlendHome2Object(_homeQ, _objQ);

        // get time between configuration
        std::vector<double> times = getTimeBetweenQs(qs);

        // creating interpolation with
        std::map<int, Q> interpolation = q_interpolation(qs, times);

        // update _path
        _path.clear();
        std::map<int,Q>::iterator it;
        for (it = interpolation.begin(); it != interpolation.end(); it++) {
            Q q = it->second;
            _path.push_back(q);
            std::cout << "\nPath configuration --> " << q << std::endl;
        }

        // run path
        std::cout << "Showing path.." << std::endl;
        log().info() << "Button 1\n";
        // Toggle the timer on and off
        if (!_timer->isActive()){
            _timer->start(100); // run 10 Hz
            _step = 0;
        }
        else
            _step = 0;
    }
    else if (obj == _btn_goal) {
        std::cout << "\nMove robot tcp to from object to goal.." << std::endl;

        std::cout << "\nAttaching the frame to tool.." << std::endl;
        // find frames
        Frame *toolFrame = _wc->findFrame("Tool");
        MovFrame *duckFrame = _wc->findFrame<MovFrame>("Duck");
        // null check
        if (toolFrame == NULL) { std::cerr << "Tool frame not found!" << std::endl; }
        if (duckFrame == NULL) { std::cerr << "Duck frame not found!" << std::endl; }
        // attach the frame to tool
        rw::kinematics::Kinematics::gripFrame(duckFrame, toolFrame, _state);
        getRobWorkStudio()->setState(_state);

        _timer->stop();
        std::vector<Q> qs;

//        // calc path rrt
//        std::cout << "\nCalculating path.." << std::endl;
//        rw::math::Math::seed();
//        double extend = 0.6;
//        double maxTime = 60;
//        createPathRRTConnect(_objQ, _goalQ, extend, maxTime);
//        std::cout << "\nPath length --> " << _path.size() << std::endl;
//        for (std::size_t i = 0; i < _path.size(); i++) {
//            qs.push_back(_path[i]);
//            std::cout << "Configuration " << i << " --> " << qs[i] << std::endl;
//        }

        qs = parabolicBlendObject2Goal(_objQ, _goalQ);

        // get time between configuration
        std::vector<double> times = getTimeBetweenQs(qs);

        // creating interpolation with
        std::map<int, Q> interpolation = q_interpolation(qs, times);

        // update _path
        _path.clear();
        std::map<int,Q>::iterator it;
        for (it = interpolation.begin(); it != interpolation.end(); it++) {
            Q q = it->second;
            _path.push_back(q);
            std::cout << "\nPath configuration --> " << q << std::endl;
        }

        // run path
        std::cout << "Showing path.." << std::endl;
        log().info() << "Button 1\n";
        // Toggle the timer on and off
        if (!_timer->isActive()){
            _timer->start(100); // run 10 Hz
            _step = 0;
        }
        else
            _step = 0;
    }
    else if (obj == _btn_home) {
        _state = _wc->getDefaultState();
        getRobWorkStudio()->setState(_state);
    }
}

void SamplePlugin::get25DImage() {
	if (_framegrabber25D != NULL) {
        // Create pcd file
        for (size_t i = 0; i < _cameras25D.size(); i++) {
			// Get the image as a RW image
            rw::kinematics::Frame* cameraFrame25D = _wc->findFrame(_cameras25D[i]); // "Camera");
			_framegrabber25D->grab(cameraFrame25D, _state);

			//const Image& image = _framegrabber->getImage();

			const rw::geometry::PointCloud* img = &(_framegrabber25D->getImage());

            std::ofstream output(_cameras25D[i] + ".pcd");
            output << "# .PCD v.5 - Point Cloud Data file format\n";
            output << "FIELDS x y z\n";
            output << "SIZE 4 4 4\n";
            output << "TYPE F F F\n";
            output << "WIDTH " << img->getWidth() << "\n";
            output << "HEIGHT " << img->getHeight() << "\n";
            output << "POINTS " << img->getData().size() << "\n";
            output << "DATA ascii\n";
            for(const auto &p_tmp : img->getData()) {
                rw::math::Vector3D<float> p = p_tmp;
                output << p(0) << " " << p(1) << " " << p(2) << "\n";
            }
            output.close();
		}
	}
}

void SamplePlugin::getImage() {
	if (_framegrabber != NULL) {
        for (size_t i = 0; i < _cameras.size(); i++) {
			// Get the image as a RW image
            rw::kinematics::Frame* cameraFrame = _wc->findFrame(_cameras[i]); // "Camera");
			_framegrabber->grab(cameraFrame, _state);

			const rw::sensor::Image* rw_image = &(_framegrabber->getImage());

			// Convert to OpenCV matrix.
			cv::Mat image = cv::Mat(rw_image->getHeight(), rw_image->getWidth(), CV_8UC3, (rw::sensor::Image*)rw_image->getImageData());

			// Convert to OpenCV image
            cv::Mat imflip, imflip_mat;
			cv::flip(image, imflip, 1);
            cv::cvtColor( imflip, imflip_mat, cv::COLOR_RGB2BGR );

			cv::imwrite(_cameras[i] + ".png", imflip_mat );

			// Show in QLabel
			QImage img(imflip.data, imflip.cols, imflip.rows, imflip.step, QImage::Format_RGB888);
			QPixmap p = QPixmap::fromImage(img);
			unsigned int maxW = 480;
			unsigned int maxH = 640;
			_label->setPixmap(p.scaled(maxW,maxH,Qt::KeepAspectRatio));
		}
	}
}

void SamplePlugin::timer() {
    if(0 <= _step && _step < _path.size()){
        _device->setQ(_path.at(_step),_state);
        getRobWorkStudio()->setState(_state);
        _step++;
    }
}

void SamplePlugin::stateChangedListener(const rw::kinematics::State& state) {
  _state = state;
}

bool SamplePlugin::checkCollisions(rw::models::Device::Ptr device,
                                   const rw::kinematics::State &state,
                                   const rw::proximity::CollisionDetector &detector,
                                   const rw::math::Q &q) {
    rw::kinematics::State testState;
    rw::proximity::CollisionDetector::QueryResult data;
    bool colFrom;

    testState = state;
    device->setQ(q,testState);
    colFrom = detector.inCollision(testState,&data);
    if (colFrom) {
        cerr << "Configuration in collision: " << q << endl;
        cerr << "Colliding frames: " << endl;
        rw::kinematics::FramePairSet fps = data.collidingFrames;
        for (rw::kinematics::FramePairSet::iterator it = fps.begin(); it != fps.end(); it++) {
            cerr << (*it).first->getName() << " " << (*it).second->getName() << endl;
        }
        return false;
    }
    return true;
}

void SamplePlugin::createPathRRTConnect(rw::math::Q from, rw::math::Q to,  double extend, double maxTime){
    _device->setQ(from,_state);
    getRobWorkStudio()->setState(_state);
    rw::proximity::CollisionDetector detector(_wc, rwlibs::proximitystrategies::ProximityStrategyFactory::makeDefaultCollisionStrategy());
    rw::pathplanning::PlannerConstraint constraint = rw::pathplanning::PlannerConstraint::make(&detector,_device,_state);
    rw::pathplanning::QSampler::Ptr sampler = rw::pathplanning::QSampler::makeConstrained(rw::pathplanning::QSampler::makeUniform(_device),constraint.getQConstraintPtr());
    rw::math::QMetric::Ptr metric = rw::math::MetricFactory::makeEuclidean<rw::math::Q>();
    rw::pathplanning::QToQPlanner::Ptr planner = rwlibs::pathplanners::RRTPlanner::makeQToQPlanner(constraint, sampler, metric, extend, rwlibs::pathplanners::RRTPlanner::RRTConnect);

    _path.clear();
    if (!checkCollisions(_device, _state, detector, from))
        cout << from << " is in colission!" << endl;
    if (!checkCollisions(_device, _state, detector, to))
        cout << to << " is in colission!" << endl;;
    rw::common::Timer t;
    t.resetAndResume();
    planner->query(from, to, _path, maxTime);
    t.pause();


    if (t.getTime() >= maxTime) {
        cout << "Notice: max time of " << maxTime << " seconds reached." << endl;
    }

	const int duration = 10;

    if(_path.size() == 2){  //The interpolated path between Q start and Q goal is collision free. Set the duration with respect to the desired velocity
        std::cout << "\nCreating linear interpolation because the path is collision free.." << std::endl;
        rw::trajectory::LinearInterpolator<rw::math::Q> linInt(from, to, duration);
        rw::trajectory::QPath tempQ;
        for(int i = 0; i < duration+1; i++){
            tempQ.push_back(linInt.x(i));
        }
        _path = tempQ;
    }
}