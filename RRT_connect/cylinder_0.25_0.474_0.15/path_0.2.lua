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

setQ({1.693 , -1.728 , -2.068 , -0.932 , 1.571 , 0})
attach(bottle, gripper)
setQ({1.54486 , -1.69392 , -2.01379 , -0.990135 , 1.5753 , 0.102737})
setQ({1.52547 , -1.68302 , -1.83019 , -1.04705 , 1.5269 , 0.117388})
setQ({1.37394 , -1.63752 , -1.72255 , -0.989817 , 1.53231 , 0.126152})
setQ({1.33394 , -1.65496 , -1.78197 , -0.994046 , 1.53884 , 0.118099})
setQ({1.22664 , -1.70175 , -1.94133 , -1.00539 , 1.55634 , 0.0964963})
setQ({1.04224 , -1.7133 , -2.00992 , -0.979681 , 1.5745 , 0.083604})
setQ({0.842578 , -1.721 , -2.00838 , -0.975528 , 1.57418 , 0.0760036})
setQ({0.64292 , -1.7287 , -2.00684 , -0.971375 , 1.57386 , 0.0684033})
setQ({0.443262 , -1.7364 , -2.0053 , -0.967222 , 1.57355 , 0.0608029})
setQ({0.243604 , -1.7441 , -2.00377 , -0.96307 , 1.57323 , 0.0532025})
setQ({0.0439467 , -1.7518 , -2.00223 , -0.958917 , 1.57291 , 0.0456022})
setQ({-0.155711 , -1.7595 , -2.00069 , -0.954764 , 1.57259 , 0.0380018})
setQ({-0.355369 , -1.7672 , -1.99915 , -0.950611 , 1.57227 , 0.0304014})
setQ({-0.555027 , -1.7749 , -1.99761 , -0.946458 , 1.57195 , 0.0228011})
setQ({-0.754684 , -1.7826 , -1.99608 , -0.942306 , 1.57164 , 0.0152007})
setQ({-0.954342 , -1.7903 , -1.99454 , -0.938153 , 1.57132 , 0.00760036})
setQ({-1.154 , -1.798 , -1.993 , -0.934 , 1.571 , 0})