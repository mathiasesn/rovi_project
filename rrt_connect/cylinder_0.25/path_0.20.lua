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
setQ({1.66135 , -1.70338 , -1.9439 , -1.03206 , 1.5007 , -0.0896503})
setQ({1.65362 , -1.65542 , -1.80497 , -0.899751 , 1.49552 , -0.118071})
setQ({1.47087 , -1.69882 , -1.79357 , -0.927819 , 1.52451 , -0.0695321})
setQ({1.28672 , -1.74256 , -1.78209 , -0.956102 , 1.55371 , -0.0206219})
setQ({1.24088 , -1.71752 , -1.95123 , -1.01741 , 1.5112 , -0.0762611})
setQ({1.0413 , -1.72422 , -1.95471 , -1.01046 , 1.51619 , -0.069906})
setQ({0.84173 , -1.73093 , -1.95819 , -1.00351 , 1.52117 , -0.0635509})
setQ({0.642157 , -1.73764 , -1.96167 , -0.99656 , 1.52615 , -0.0571958})
setQ({0.442584 , -1.74434 , -1.96515 , -0.989608 , 1.53113 , -0.0508407})
setQ({0.243011 , -1.75105 , -1.96863 , -0.982657 , 1.53612 , -0.0444856})
setQ({0.0434377 , -1.75776 , -1.97211 , -0.975706 , 1.5411 , -0.0381305})
setQ({-0.156135 , -1.76446 , -1.9756 , -0.968755 , 1.54608 , -0.0317754})
setQ({-0.355708 , -1.77117 , -1.97908 , -0.961804 , 1.55107 , -0.0254204})
setQ({-0.555281 , -1.77788 , -1.98256 , -0.954853 , 1.55605 , -0.0190653})
setQ({-0.754854 , -1.78459 , -1.98604 , -0.947902 , 1.56103 , -0.0127102})
setQ({-0.954427 , -1.79129 , -1.98952 , -0.940951 , 1.56602 , -0.00635509})
setQ({-1.154 , -1.798 , -1.993 , -0.934 , 1.571 , 0})
