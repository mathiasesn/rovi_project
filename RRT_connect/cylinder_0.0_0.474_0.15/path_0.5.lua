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
setQ({2.25921 , -1.55138 , -1.88189 , -0.802302 , 1.32024 , -0.313863})
setQ({1.81408 , -1.58354 , -1.89638 , -0.819478 , 1.35294 , -0.272931})
setQ({1.3194 , -1.61928 , -1.91248 , -0.838565 , 1.38929 , -0.227443})
setQ({0.824722 , -1.65503 , -1.92859 , -0.857652 , 1.42563 , -0.181954})
setQ({0.330041 , -1.69077 , -1.94469 , -0.876739 , 1.46197 , -0.136466})
setQ({-0.164639 , -1.72651 , -1.96079 , -0.895826 , 1.49831 , -0.090977})
setQ({-0.65932 , -1.76226 , -1.9769 , -0.914913 , 1.53466 , -0.0454885})
setQ({-1.154 , -1.798 , -1.993 , -0.934 , 1.571 , 0})