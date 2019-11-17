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
setQ({2.10843 , -1.83663 , -1.96452 , -0.915389 , 1.54627 , -0.0358711})
setQ({2.12016 , -1.85144 , -1.91068 , -0.902317 , 1.4948 , 0.0267632})
setQ({2.13419 , -1.83593 , -1.8506 , -0.953242 , 1.44674 , 0.0591815})
setQ({2.12151 , -1.80067 , -1.83664 , -1.0188 , 1.38285 , 0.0638047})
setQ({2.11455 , -1.79146 , -1.84356 , -1.08262 , 1.30729 , 0.0576327})
setQ({2.06509 , -1.7873 , -1.83249 , -1.13842 , 1.25635 , 0.0989189})
setQ({2.08338 , -1.74454 , -1.8518 , -1.13664 , 1.18507 , 0.0501508})
setQ({2.07557 , -1.7284 , -1.86033 , -1.23451 , 1.186 , 0.05531})
setQ({2.04876 , -1.73812 , -1.79433 , -1.26929 , 1.12791 , 0.0709639})
setQ({2.00168 , -1.74018 , -1.7193 , -1.26256 , 1.08261 , 0.0781488})
setQ({1.9546 , -1.74223 , -1.64426 , -1.25582 , 1.03731 , 0.0853337})
setQ({1.90752 , -1.74429 , -1.56923 , -1.24909 , 0.992005 , 0.0925186})
setQ({1.86044 , -1.74634 , -1.49419 , -1.24236 , 0.946705 , 0.0997036})
setQ({1.81336 , -1.7484 , -1.41916 , -1.23562 , 0.901405 , 0.106888})
setQ({1.76629 , -1.75045 , -1.34412 , -1.22889 , 0.856105 , 0.114073})
setQ({1.71921 , -1.75251 , -1.26909 , -1.22216 , 0.810805 , 0.121258})
setQ({1.67213 , -1.75456 , -1.19405 , -1.21542 , 0.765505 , 0.128443})
setQ({1.62505 , -1.75662 , -1.11902 , -1.20869 , 0.720205 , 0.135628})
setQ({1.57797 , -1.75867 , -1.04398 , -1.20196 , 0.674905 , 0.142813})
setQ({1.53089 , -1.76073 , -0.968945 , -1.19523 , 0.629605 , 0.149998})
setQ({1.48381 , -1.76278 , -0.89391 , -1.18849 , 0.584305 , 0.157183})
setQ({1.46306 , -1.76369 , -0.860845 , -1.18553 , 0.564343 , 0.160349})
setQ({1.45467 , -1.76754 , -0.895191 , -1.2058 , 0.640504 , 0.210583})
setQ({1.44034 , -1.77383 , -0.943029 , -1.14498 , 0.685551 , 0.168896})
setQ({1.40294 , -1.74491 , -0.947415 , -1.14812 , 0.769496 , 0.142646})
setQ({1.41388 , -1.73808 , -0.982348 , -1.09599 , 0.808544 , 0.0765307})
setQ({1.37031 , -1.74695 , -1.03513 , -1.10371 , 0.764039 , 0.0199842})
setQ({1.34713 , -1.7209 , -1.11914 , -1.12912 , 0.783919 , -0.00618358})
setQ({1.31978 , -1.75928 , -1.16348 , -1.06782 , 0.826653 , -0.0213051})
setQ({1.32593 , -1.7651 , -1.21976 , -1.05276 , 0.888637 , -0.0731882})
setQ({1.3344 , -1.75664 , -1.29436 , -1.10662 , 0.887114 , -0.0359253})
setQ({1.32677 , -1.74293 , -1.35942 , -1.03314 , 0.876081 , -0.0360315})
setQ({1.29682 , -1.7358 , -1.37077 , -0.990449 , 0.92712 , 0.0310199})
setQ({1.31392 , -1.74053 , -1.44219 , -0.963832 , 0.988879 , 0.038919})
setQ({1.27972 , -1.76042 , -1.47668 , -0.934729 , 1.05781 , 0.0794763})
setQ({1.27815 , -1.80633 , -1.50489 , -0.925369 , 1.1229 , 0.026837})
setQ({1.27127 , -1.84185 , -1.52272 , -0.932703 , 1.19281 , -0.0317387})
setQ({1.27884 , -1.82176 , -1.59519 , -0.929325 , 1.257 , -0.0192132})
setQ({1.24366 , -1.8286 , -1.6417 , -0.877305 , 1.29862 , -0.0651854})
setQ({1.19932 , -1.82125 , -1.72502 , -0.881348 , 1.28033 , -0.0914004})
setQ({1.21172 , -1.83037 , -1.76864 , -0.834926 , 1.34706 , -0.0560231})
setQ({1.22044 , -1.83092 , -1.84813 , -0.850101 , 1.37855 , -0.104837})
setQ({1.19149 , -1.81378 , -1.904 , -0.853275 , 1.45305 , -0.0911588})
setQ({1.16168 , -1.8392 , -1.89694 , -0.910457 , 1.49342 , -0.0318649})
setQ({1.14551 , -1.82523 , -1.97293 , -0.920882 , 1.55357 , -0.0252836})
setQ({1.04553 , -1.82405 , -1.9738 , -0.921452 , 1.55433 , -0.0241843})
setQ({0.945551 , -1.82286 , -1.97467 , -0.922023 , 1.55509 , -0.023085})
setQ({0.845573 , -1.82168 , -1.97555 , -0.922593 , 1.55584 , -0.0219857})
setQ({0.745594 , -1.8205 , -1.97642 , -0.923163 , 1.5566 , -0.0208864})
setQ({0.645616 , -1.81931 , -1.97729 , -0.923734 , 1.55736 , -0.0197871})
setQ({0.545637 , -1.81813 , -1.97816 , -0.924304 , 1.55812 , -0.0186879})
setQ({0.445658 , -1.81694 , -1.97904 , -0.924874 , 1.55888 , -0.0175886})
setQ({0.34568 , -1.81576 , -1.97991 , -0.925445 , 1.55963 , -0.0164893})
setQ({0.245701 , -1.81458 , -1.98078 , -0.926015 , 1.56039 , -0.01539})
setQ({0.145722 , -1.81339 , -1.98165 , -0.926585 , 1.56115 , -0.0142907})
setQ({0.0457437 , -1.81221 , -1.98253 , -0.927156 , 1.56191 , -0.0131914})
setQ({-0.054235 , -1.81102 , -1.9834 , -0.927726 , 1.56266 , -0.0120921})
setQ({-0.154214 , -1.80984 , -1.98427 , -0.928297 , 1.56342 , -0.0109929})
setQ({-0.254192 , -1.80866 , -1.98515 , -0.928867 , 1.56418 , -0.00989357})
setQ({-0.354171 , -1.80747 , -1.98602 , -0.929437 , 1.56494 , -0.00879428})
setQ({-0.45415 , -1.80629 , -1.98689 , -0.930008 , 1.5657 , -0.007695})
setQ({-0.554128 , -1.8051 , -1.98776 , -0.930578 , 1.56645 , -0.00659571})
setQ({-0.654107 , -1.80392 , -1.98864 , -0.931148 , 1.56721 , -0.00549643})
setQ({-0.754085 , -1.80274 , -1.98951 , -0.931719 , 1.56797 , -0.00439714})
setQ({-0.854064 , -1.80155 , -1.99038 , -0.932289 , 1.56873 , -0.00329786})
setQ({-0.954043 , -1.80037 , -1.99125 , -0.932859 , 1.56948 , -0.00219857})
setQ({-1.05402 , -1.79918 , -1.99213 , -0.93343 , 1.57024 , -0.00109929})
setQ({-1.154 , -1.798 , -1.993 , -0.934 , 1.571 , 0})