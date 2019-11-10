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
setQ({1.52793 , -0.684174 , -1.51612 , -0.679328 , -0.160536 , 2.39928})
setQ({0.898683 , -0.945505 , -1.62801 , -0.73908 , 0.245726 , 1.83635})
setQ({-1.154 , -1.798 , -1.993 , -0.934 , 1.571 , 0})