wc = rws.getRobWorkStudio():getWorkCell()
state = wc:getDefaultState()
device = wc:findDevice("UR-6-85-5-A")
gripper = wc:findFrame("Tool")
bottle = wc:findFrame("Cylinder")
table = wc:findFrame("Table")

function setQ(q)
qq = rw.Q(#q,q[1],q[2],q[3],q[4],q[5],q[6])
device:setQ(qq,state)
rws.getRobWorkStudio():setState(state)
rw.sleep(0.1)
end

function attach(obj, tool)
rw.gripFrame(obj, tool, state)
rws.getRobWorkStudio():setState(state)
rw.sleep(0.1)
end

setQ({2.5 , -2.099 , -1.593 , -0.991 , 1.571 , 0})
attach(bottle, gripper)
setQ({2.50116 , -2.10818 , -1.55975 , -1.04096 , 1.49436 , 0.020953})
setQ({2.50354 , -2.10804 , -1.51866 , -1.07832 , 1.42592 , 0.068137})
setQ({2.46715 , -2.08829 , -1.45799 , -1.10695 , 1.40635 , 0.0098101})
setQ({2.47946 , -2.04306 , -1.37948 , -1.10212 , 1.37158 , -0.0103232})
setQ({2.39018 , -2.03547 , -1.36014 , -1.06888 , 1.35184 , -0.0205105})
setQ({2.30091 , -2.02788 , -1.3408 , -1.03563 , 1.33209 , -0.0306978})
setQ({2.21164 , -2.02029 , -1.32146 , -1.00238 , 1.31235 , -0.0408851})
setQ({2.12237 , -2.01271 , -1.30212 , -0.969137 , 1.2926 , -0.0510724})
setQ({2.0331 , -2.00512 , -1.28278 , -0.935891 , 1.27286 , -0.0612598})
setQ({1.94383 , -1.99753 , -1.26344 , -0.902645 , 1.25311 , -0.0714471})
setQ({1.85455 , -1.98994 , -1.24411 , -0.869398 , 1.23337 , -0.0816344})
setQ({1.76528 , -1.98236 , -1.22477 , -0.836152 , 1.21362 , -0.0918217})
setQ({1.67601 , -1.97477 , -1.20543 , -0.802906 , 1.19388 , -0.102009})
setQ({1.58674 , -1.96718 , -1.18609 , -0.769659 , 1.17413 , -0.112196})
setQ({1.49747 , -1.95959 , -1.16675 , -0.736413 , 1.15439 , -0.122384})
setQ({1.40819 , -1.95201 , -1.14741 , -0.703167 , 1.13464 , -0.132571})
setQ({1.31892 , -1.94442 , -1.12807 , -0.66992 , 1.1149 , -0.142758})
setQ({1.22965 , -1.93683 , -1.10873 , -0.636674 , 1.09515 , -0.152946})
setQ({1.18558 , -1.93308 , -1.09919 , -0.62026 , 1.0854 , -0.157975})
setQ({1.19198 , -1.94817 , -1.18333 , -0.660124 , 1.10932 , -0.135842})
setQ({1.2139 , -1.91888 , -1.22444 , -0.632396 , 1.1679 , -0.0832031})
setQ({1.21894 , -1.93663 , -1.29052 , -0.637133 , 1.20281 , -0.0195453})
setQ({1.26446 , -1.90213 , -1.34475 , -0.697856 , 1.21187 , -0.0247239})
setQ({1.21642 , -1.9164 , -1.35039 , -0.781814 , 1.20176 , -0.0422145})
setQ({1.18183 , -1.91032 , -1.41042 , -0.823317 , 1.26039 , -0.0410849})
setQ({1.19446 , -1.89778 , -1.47265 , -0.83798 , 1.32116 , -0.0846992})
setQ({1.22471 , -1.90826 , -1.54257 , -0.846845 , 1.38418 , -0.0907941})
setQ({1.20805 , -1.91009 , -1.52362 , -0.907984 , 1.4426 , -0.0437912})
setQ({1.19398 , -1.92398 , -1.57048 , -0.92732 , 1.48467 , 0.0288009})
setQ({1.22383 , -1.94627 , -1.66081 , -0.944097 , 1.48903 , 0.0164896})
setQ({1.21935 , -1.99941 , -1.71168 , -1.00345 , 1.52124 , 0.0136051})
setQ({1.12046 , -1.99102 , -1.7234 , -1.00056 , 1.52331 , 0.0130382})
setQ({1.02157 , -1.98262 , -1.73513 , -0.997664 , 1.52538 , 0.0124714})
setQ({0.922685 , -1.97423 , -1.74685 , -0.99477 , 1.52746 , 0.0119045})
setQ({0.823795 , -1.96584 , -1.75857 , -0.991876 , 1.52953 , 0.0113376})
setQ({0.724905 , -1.95745 , -1.77029 , -0.988983 , 1.53161 , 0.0107707})
setQ({0.626016 , -1.94906 , -1.78201 , -0.986089 , 1.53368 , 0.0102038})
setQ({0.527126 , -1.94066 , -1.79373 , -0.983195 , 1.53575 , 0.00963696})
setQ({0.428236 , -1.93227 , -1.80545 , -0.980301 , 1.53783 , 0.00907008})
setQ({0.329346 , -1.92388 , -1.81718 , -0.977407 , 1.5399 , 0.0085032})
setQ({0.230457 , -1.91549 , -1.8289 , -0.974513 , 1.54197 , 0.00793632})
setQ({0.131567 , -1.9071 , -1.84062 , -0.97162 , 1.54405 , 0.00736944})
setQ({0.0326771 , -1.8987 , -1.85234 , -0.968726 , 1.54612 , 0.00680256})
setQ({-0.0662126 , -1.89031 , -1.86406 , -0.965832 , 1.54819 , 0.00623568})
setQ({-0.165102 , -1.88192 , -1.87578 , -0.962938 , 1.55027 , 0.0056688})
setQ({-0.263992 , -1.87353 , -1.88751 , -0.960044 , 1.55234 , 0.00510192})
setQ({-0.362882 , -1.86514 , -1.89923 , -0.957151 , 1.55441 , 0.00453504})
setQ({-0.461772 , -1.85674 , -1.91095 , -0.954257 , 1.55649 , 0.00396816})
setQ({-0.560661 , -1.84835 , -1.92267 , -0.951363 , 1.55856 , 0.00340128})
setQ({-0.659551 , -1.83996 , -1.93439 , -0.948469 , 1.56063 , 0.0028344})
setQ({-0.758441 , -1.83157 , -1.94611 , -0.945575 , 1.56271 , 0.00226752})
setQ({-0.857331 , -1.82318 , -1.95784 , -0.942681 , 1.56478 , 0.00170064})
setQ({-0.95622 , -1.81478 , -1.96956 , -0.939788 , 1.56685 , 0.00113376})
setQ({-1.05511 , -1.80639 , -1.98128 , -0.936894 , 1.56893 , 0.00056688})
setQ({-1.154 , -1.798 , -1.993 , -0.934 , 1.571 , 0})