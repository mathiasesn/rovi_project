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

setQ({2.185 , -1.795 , -1.987 , -0.915 , 1.571 , 0})
attach(bottle, gripper)
setQ({1.83001 , -1.19092 , -1.48084 , -0.578722 , 1.05789 , -0.914608})
setQ({1.393 , -1.27983 , -1.55584 , -0.630753 , 1.13304 , -0.780662})
setQ({0.119498 , -1.53892 , -1.77442 , -0.782376 , 1.35202 , -0.390331})
setQ({-1.154 , -1.798 , -1.993 , -0.934 , 1.571 , 0})