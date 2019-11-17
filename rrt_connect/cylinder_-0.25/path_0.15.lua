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
setQ({2.48643 , -2.03819 , -1.62536 , -0.926621 , 1.49368 , -0.0863029})
setQ({2.41847 , -1.97385 , -1.65975 , -0.942951 , 1.39272 , -0.132147})
setQ({2.40919 , -1.91742 , -1.67815 , -1.0646 , 1.3894 , -0.196026})
setQ({2.32257 , -1.88984 , -1.59268 , -1.06047 , 1.30961 , -0.172637})
setQ({2.23596 , -1.86225 , -1.5072 , -1.05633 , 1.22982 , -0.149248})
setQ({2.14935 , -1.83466 , -1.42172 , -1.0522 , 1.15003 , -0.125859})
setQ({2.06273 , -1.80708 , -1.33625 , -1.04806 , 1.07024 , -0.10247})
setQ({1.97612 , -1.77949 , -1.25077 , -1.04393 , 0.990447 , -0.0790813})
setQ({1.93121 , -1.76519 , -1.20645 , -1.04178 , 0.949079 , -0.0669551})
setQ({1.94278 , -1.82756 , -1.25663 , -1.12895 , 1.00443 , 0.00582095})
setQ({1.93687 , -1.86229 , -1.27787 , -1.03915 , 1.08311 , 0.086776})
setQ({1.95648 , -1.85483 , -1.41683 , -1.04887 , 1.13363 , 0.0765735})
setQ({1.94548 , -1.87322 , -1.52885 , -1.05086 , 1.22596 , 0.107595})
setQ({1.93261 , -1.9075 , -1.5527 , -0.953511 , 1.26251 , 0.00871039})
setQ({1.91089 , -1.91867 , -1.65858 , -0.892563 , 1.32974 , -0.0408656})
setQ({1.76584 , -1.9029 , -1.65825 , -0.878164 , 1.31174 , -0.0147806})
setQ({1.62079 , -1.88713 , -1.65791 , -0.863764 , 1.29374 , 0.0113044})
setQ({1.47574 , -1.87137 , -1.65758 , -0.849365 , 1.27575 , 0.0373893})
setQ({1.33069 , -1.8556 , -1.65725 , -0.834966 , 1.25775 , 0.0634743})
setQ({1.30262 , -1.86139 , -1.64533 , -0.766894 , 1.36035 , 0.143323})
setQ({1.31666 , -1.8996 , -1.66112 , -0.853454 , 1.47458 , 0.150489})
setQ({1.32919 , -1.93418 , -1.64843 , -0.93117 , 1.58477 , 0.0975285})
setQ({1.24603 , -1.99865 , -1.62857 , -1.02664 , 1.55562 , 0.0648016})
setQ({1.0974 , -1.9861 , -1.64414 , -1.02403 , 1.5556 , 0.0655353})
setQ({0.948759 , -1.97355 , -1.6597 , -1.02143 , 1.55558 , 0.066269})
setQ({0.800121 , -1.96101 , -1.67527 , -1.01883 , 1.55556 , 0.0670027})
setQ({0.651484 , -1.94846 , -1.69083 , -1.01623 , 1.55554 , 0.0677364})
setQ({0.502847 , -1.93591 , -1.7064 , -1.01363 , 1.55552 , 0.0684701})
setQ({0.35421 , -1.92336 , -1.72196 , -1.01103 , 1.5555 , 0.0692037})
setQ({0.205573 , -1.91081 , -1.73752 , -1.00842 , 1.55548 , 0.0699374})
setQ({0.0569361 , -1.89826 , -1.75309 , -1.00582 , 1.55546 , 0.0706711})
setQ({-0.091701 , -1.88571 , -1.76865 , -1.00322 , 1.55544 , 0.0714048})
setQ({-0.240338 , -1.87317 , -1.78422 , -1.00062 , 1.55542 , 0.0721385})
setQ({-0.388975 , -1.86062 , -1.79978 , -0.998016 , 1.5554 , 0.0728722})
setQ({-0.537612 , -1.84807 , -1.81535 , -0.995414 , 1.55538 , 0.0736058})
setQ({-0.686249 , -1.83552 , -1.83091 , -0.992812 , 1.55536 , 0.0743395})
setQ({-0.834886 , -1.82297 , -1.84647 , -0.99021 , 1.55534 , 0.0750732})
setQ({-0.983523 , -1.81042 , -1.86204 , -0.987608 , 1.55532 , 0.0758069})
setQ({-1.13216 , -1.79788 , -1.8776 , -0.985006 , 1.5553 , 0.0765406})
setQ({-1.154 , -1.798 , -1.993 , -0.934 , 1.571 , 0})