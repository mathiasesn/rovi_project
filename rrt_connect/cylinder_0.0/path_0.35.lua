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
setQ({1.97311 , -1.78495 , -1.8541 , -1.03976 , 1.42812 , 0.154459})
setQ({1.8448 , -1.77994 , -1.73697 , -1.29695 , 1.30441 , 0.258599})
setQ({1.88432 , -1.62857 , -1.55949 , -1.41152 , 1.14288 , 0.0933639})
setQ({1.83062 , -1.63905 , -1.59195 , -1.38378 , 1.14721 , 0.0779333})
setQ({1.56675 , -1.69058 , -1.75145 , -1.24748 , 1.16847 , 0.00211668})
setQ({1.30288 , -1.7421 , -1.91095 , -1.11118 , 1.18974 , -0.0736999})
setQ({1.28667 , -1.78782 , -1.88459 , -1.01655 , 1.45948 , 0.120553})
setQ({0.938001 , -1.78927 , -1.90008 , -1.00475 , 1.47542 , 0.103331})
setQ({0.589334 , -1.79073 , -1.91556 , -0.992962 , 1.49135 , 0.0861094})
setQ({0.240667 , -1.79218 , -1.93105 , -0.981169 , 1.50728 , 0.0688875})
setQ({-0.107999 , -1.79364 , -1.94654 , -0.969377 , 1.52321 , 0.0516657})
setQ({-0.456666 , -1.79509 , -1.96203 , -0.957585 , 1.53914 , 0.0344438})
setQ({-0.805333 , -1.79655 , -1.97751 , -0.945792 , 1.55507 , 0.0172219})
setQ({-1.154 , -1.798 , -1.993 , -0.934 , 1.571 , 0})
