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
setQ({1.73797 , -1.62403 , -1.73741 , -0.823423 , 1.44277 , -0.0982045})
setQ({1.62385 , -1.63089 , -1.7475 , -0.827787 , 1.44783 , -0.0943291})
setQ({1.22701 , -1.65477 , -1.78257 , -0.84296 , 1.46542 , -0.0808536})
setQ({0.830179 , -1.67864 , -1.81764 , -0.858133 , 1.48302 , -0.067378})
setQ({0.433343 , -1.70251 , -1.85271 , -0.873307 , 1.50061 , -0.0539024})
setQ({0.0365072 , -1.72638 , -1.88778 , -0.88848 , 1.51821 , -0.0404268})
setQ({-0.360329 , -1.75026 , -1.92286 , -0.903653 , 1.53581 , -0.0269512})
setQ({-0.757164 , -1.77413 , -1.95793 , -0.918827 , 1.5534 , -0.0134756})
setQ({-1.154 , -1.798 , -1.993 , -0.934 , 1.571 , 0})
