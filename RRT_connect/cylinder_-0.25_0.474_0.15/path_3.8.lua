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
setQ({2.36819 , -0.331989 , -2.78999 , -1.03829 , 0.6005 , -2.98721})
setQ({1.51932 , -0.685307 , -2.59791 , -1.01316 , 0.834397 , -2.26727})
setQ({-1.154 , -1.798 , -1.993 , -0.934 , 1.571 , 0})