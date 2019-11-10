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
setQ({2.56804 , -1.67049 , -2.30866 , 0.722895 , 2.04706 , 0.785979})
setQ({1.46416 , -1.78946 , -1.46018 , -0.0539604 , 1.61491 , 0.546466})
setQ({0.0788693 , -1.93875 , -0.395392 , -1.02886 , 1.07259 , 0.245894})
setQ({-1.154 , -1.798 , -1.993 , -0.934 , 1.571 , 0})