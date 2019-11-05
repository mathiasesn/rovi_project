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
setQ({1.69481 , -1.72935 , -2.06436 , -0.934946 , 1.56529 , -0.00119863})
setQ({1.69653 , -1.72868 , -2.05802 , -0.933112 , 1.56161 , -0.000493812})
setQ({1.69629 , -1.72723 , -2.05654 , -0.936762 , 1.55509 , -0.00138448})
setQ({1.69787 , -1.72649 , -2.04929 , -0.936075 , 1.55581 , -0.00351191})
setQ({1.69947 , -1.72712 , -2.04329 , -0.933491 , 1.55406 , -5.94356e-07})
setQ({1.70259 , -1.72434 , -2.03965 , -0.931091 , 1.55104 , 0.00392671})
setQ({1.70403 , -1.72111 , -2.03563 , -0.930068 , 1.54996 , 0.00941162})
setQ({1.70702 , -1.71901 , -2.03686 , -0.926808 , 1.548 , 0.0150374})
setQ({1.70753 , -1.71995 , -2.03104 , -0.927616 , 1.54361 , 0.0174855})
setQ({1.70669 , -1.72097 , -2.0256 , -0.92635 , 1.53836 , 0.0167069})
setQ({1.70956 , -1.72048 , -2.02369 , -0.925139 , 1.53182 , 0.0145506})
setQ({1.71121 , -1.72051 , -2.01815 , -0.926066 , 1.52665 , 0.0142549})
setQ({1.70864 , -1.72073 , -2.0124 , -0.928522 , 1.52292 , 0.0154091})
setQ({1.70762 , -1.72315 , -2.00622 , -0.927817 , 1.51981 , 0.0130116})
setQ({1.70471 , -1.72285 , -2.00182 , -0.928415 , 1.51419 , 0.0141159})
setQ({1.70293 , -1.72313 , -1.99946 , -0.932455 , 1.50983 , 0.0182279})
setQ({1.70542 , -1.72274 , -1.9966 , -0.931697 , 1.50361 , 0.020916})
setQ({1.70306 , -1.72557 , -1.99143 , -0.928171 , 1.50365 , 0.0238021})
setQ({1.70386 , -1.72482 , -1.98557 , -0.92729 , 1.49944 , 0.0211687})
setQ({1.7015 , -1.7259 , -1.97943 , -0.930039 , 1.4984 , 0.0239905})
setQ({1.70064 , -1.72755 , -1.97383 , -0.925083 , 1.49888 , 0.0227894})
setQ({1.69955 , -1.72682 , -1.96965 , -0.927964 , 1.49611 , 0.017697})
setQ({1.69788 , -1.72817 , -1.9632 , -0.930702 , 1.49427 , 0.0196634})
setQ({1.69821 , -1.72642 , -1.95965 , -0.933031 , 1.48903 , 0.0231865})
setQ({1.69387 , -1.72666 , -1.95473 , -0.936028 , 1.48695 , 0.0210652})
setQ({1.69233 , -1.72764 , -1.94801 , -0.935453 , 1.48788 , 0.0176987})
setQ({1.69078 , -1.72999 , -1.9425 , -0.933014 , 1.48582 , 0.0212473})
setQ({1.68681 , -1.73173 , -1.93819 , -0.932822 , 1.48368 , 0.0256168})
setQ({1.68559 , -1.73013 , -1.93704 , -0.934521 , 1.47731 , 0.0221384})
setQ({1.68424 , -1.73271 , -1.93258 , -0.935455 , 1.4727 , 0.018892})
setQ({1.6825 , -1.72947 , -1.93302 , -0.940112 , 1.46764 , 0.0191596})
setQ({1.67821 , -1.73022 , -1.92846 , -0.941728 , 1.46338 , 0.0198075})
setQ({1.67675 , -1.73379 , -1.92647 , -0.943584 , 1.45831 , 0.0161959})
setQ({1.67239 , -1.73511 , -1.92257 , -0.94509 , 1.45384 , 0.0178834})
setQ({1.67156 , -1.73625 , -1.92149 , -0.949881 , 1.44824 , 0.0197661})
setQ({1.6724 , -1.73613 , -1.91644 , -0.953397 , 1.44392 , 0.0178216})
setQ({1.67146 , -1.73725 , -1.915 , -0.958077 , 1.43946 , 0.0139389})
setQ({1.67374 , -1.73578 , -1.91274 , -0.956698 , 1.43285 , 0.0122392})
setQ({1.67447 , -1.73375 , -1.91091 , -0.961683 , 1.42983 , 0.0166072})
setQ({1.67244 , -1.73227 , -1.9079 , -0.964891 , 1.42408 , 0.015115})
setQ({1.66948 , -1.72996 , -1.90863 , -0.96695 , 1.4184 , 0.0182658})
setQ({1.66519 , -1.72571 , -1.90752 , -0.964268 , 1.4158 , 0.0151863})
setQ({1.6656 , -1.7246 , -1.90131 , -0.966082 , 1.41205 , 0.0171063})
setQ({1.66727 , -1.7261 , -1.89802 , -0.969687 , 1.40639 , 0.0167863})
setQ({1.66814 , -1.72587 , -1.89178 , -0.973646 , 1.40783 , 0.0186742})
setQ({1.668 , -1.72472 , -1.8873 , -0.977754 , 1.40414 , 0.0216983})
setQ({1.66922 , -1.72527 , -1.88679 , -0.982264 , 1.39841 , 0.0192805})
setQ({1.6648 , -1.72694 , -1.88321 , -0.986147 , 1.39761 , 0.0160861})
setQ({1.66453 , -1.72648 , -1.87867 , -0.990407 , 1.39291 , 0.0162438})
setQ({1.66048 , -1.72641 , -1.87444 , -0.993916 , 1.38948 , 0.0146292})
setQ({1.66187 , -1.72688 , -1.87261 , -0.997997 , 1.38465 , 0.0106907})
setQ({1.65744 , -1.72762 , -1.87056 , -1.00276 , 1.38111 , 0.0118856})
setQ({1.65935 , -1.72732 , -1.86681 , -1.00774 , 1.37763 , 0.0144008})
setQ({1.65549 , -1.72755 , -1.86559 , -1.01173 , 1.37281 , 0.0167132})
setQ({1.65427 , -1.72802 , -1.86248 , -1.01423 , 1.36809 , 0.0213039})
setQ({1.65068 , -1.72709 , -1.85763 , -1.01814 , 1.36683 , 0.0239203})
setQ({1.64812 , -1.7252 , -1.85777 , -1.01695 , 1.35979 , 0.023687})
setQ({1.6502 , -1.72202 , -1.85663 , -1.02176 , 1.35733 , 0.027697})
setQ({1.64867 , -1.71911 , -1.85671 , -1.02433 , 1.35483 , 0.033814})
setQ({1.64353 , -1.71653 , -1.85756 , -1.02478 , 1.35009 , 0.035941})
setQ({1.64522 , -1.71834 , -1.85207 , -1.0268 , 1.34748 , 0.039671})
setQ({1.64131 , -1.71712 , -1.84864 , -1.03108 , 1.3455 , 0.042884})
setQ({1.6413 , -1.7189 , -1.84409 , -1.03682 , 1.346 , 0.0409091})
setQ({1.63649 , -1.71787 , -1.8411 , -1.04033 , 1.3422 , 0.0398266})
setQ({1.6307 , -1.71564 , -1.83852 , -1.04254 , 1.33935 , 0.0415201})
setQ({1.62436 , -1.71483 , -1.83673 , -1.04663 , 1.33899 , 0.0418107})
setQ({1.62518 , -1.71244 , -1.83661 , -1.0505 , 1.33808 , 0.0480437})
setQ({1.62064 , -1.71284 , -1.83267 , -1.05222 , 1.3347 , 0.0512609})
setQ({1.61787 , -1.713 , -1.82668 , -1.05499 , 1.33478 , 0.0543686})
setQ({1.61273 , -1.71209 , -1.82638 , -1.05541 , 1.32998 , 0.0575984})
setQ({1.6113 , -1.71246 , -1.82129 , -1.05916 , 1.32572 , 0.0584518})
setQ({1.60858 , -1.71405 , -1.81684 , -1.06319 , 1.32269 , 0.0560086})
setQ({1.60382 , -1.71335 , -1.81503 , -1.06295 , 1.31681 , 0.0559885})
setQ({1.59879 , -1.71148 , -1.81331 , -1.06437 , 1.31288 , 0.0594198})
setQ({1.59519 , -1.7117 , -1.81066 , -1.06759 , 1.3091 , 0.0553667})
setQ({1.59706 , -1.71049 , -1.80972 , -1.07248 , 1.30508 , 0.0592502})
setQ({1.59832 , -1.71085 , -1.80598 , -1.07604 , 1.30036 , 0.0624779})
setQ({1.5936 , -1.71143 , -1.80555 , -1.08035 , 1.29719 , 0.0655648})
setQ({1.58805 , -1.71227 , -1.80498 , -1.08088 , 1.2926 , 0.0683824})
setQ({1.58167 , -1.70885 , -1.80627 , -1.08086 , 1.29081 , 0.0664355})
setQ({1.57618 , -1.70711 , -1.80522 , -1.08037 , 1.28681 , 0.0631933})
setQ({1.57212 , -1.70865 , -1.80256 , -1.08403 , 1.28239 , 0.0616939})
setQ({1.57201 , -1.7086 , -1.80144 , -1.08991 , 1.28228 , 0.0566801})
setQ({1.56614 , -1.70648 , -1.80063 , -1.08936 , 1.27977 , 0.0528313})
setQ({1.5604 , -1.70539 , -1.79924 , -1.09087 , 1.27537 , 0.0510085})
setQ({1.55637 , -1.70553 , -1.79486 , -1.09348 , 1.2731 , 0.0473167})
setQ({1.55755 , -1.70478 , -1.78877 , -1.095 , 1.27207 , 0.0430069})
setQ({1.55366 , -1.70419 , -1.78398 , -1.09901 , 1.27108 , 0.045371})
setQ({1.54895 , -1.70494 , -1.78166 , -1.09938 , 1.26673 , 0.0490936})
setQ({1.54959 , -1.70397 , -1.77587 , -1.10366 , 1.26395 , 0.0487302})
setQ({1.5474 , -1.70494 , -1.7695 , -1.10402 , 1.26605 , 0.0519253})
setQ({1.54389 , -1.70507 , -1.76596 , -1.10678 , 1.26806 , 0.0469822})
setQ({1.53951 , -1.7046 , -1.76308 , -1.11179 , 1.26658 , 0.0494452})
setQ({1.53172 , -1.70484 , -1.76326 , -1.11155 , 1.26686 , 0.0492175})
setQ({1.52392 , -1.70507 , -1.76344 , -1.11132 , 1.26715 , 0.0489897})
setQ({1.51613 , -1.7053 , -1.76363 , -1.11109 , 1.26744 , 0.0487619})
setQ({1.50833 , -1.70553 , -1.76381 , -1.11086 , 1.26773 , 0.0485341})
setQ({1.50054 , -1.70576 , -1.76399 , -1.11062 , 1.26801 , 0.0483063})
setQ({1.49274 , -1.70599 , -1.76417 , -1.11039 , 1.2683 , 0.0480785})
setQ({1.48495 , -1.70623 , -1.76436 , -1.11016 , 1.26859 , 0.0478507})
setQ({1.47715 , -1.70646 , -1.76454 , -1.10992 , 1.26888 , 0.0476229})
setQ({1.46936 , -1.70669 , -1.76472 , -1.10969 , 1.26916 , 0.0473952})
setQ({1.46156 , -1.70692 , -1.76491 , -1.10946 , 1.26945 , 0.0471674})
setQ({1.45377 , -1.70715 , -1.76509 , -1.10923 , 1.26974 , 0.0469396})
setQ({1.44597 , -1.70738 , -1.76527 , -1.10899 , 1.27002 , 0.0467118})
setQ({1.43818 , -1.70761 , -1.76545 , -1.10876 , 1.27031 , 0.046484})
setQ({1.43038 , -1.70785 , -1.76564 , -1.10853 , 1.2706 , 0.0462562})
setQ({1.42259 , -1.70808 , -1.76582 , -1.10829 , 1.27089 , 0.0460284})
setQ({1.41479 , -1.70831 , -1.766 , -1.10806 , 1.27117 , 0.0458006})
setQ({1.407 , -1.70854 , -1.76618 , -1.10783 , 1.27146 , 0.0455729})
setQ({1.3992 , -1.70877 , -1.76637 , -1.1076 , 1.27175 , 0.0453451})
setQ({1.39141 , -1.709 , -1.76655 , -1.10736 , 1.27204 , 0.0451173})
setQ({1.38361 , -1.70924 , -1.76673 , -1.10713 , 1.27232 , 0.0448895})
setQ({1.37582 , -1.70947 , -1.76692 , -1.1069 , 1.27261 , 0.0446617})
setQ({1.36802 , -1.7097 , -1.7671 , -1.10666 , 1.2729 , 0.0444339})
setQ({1.36023 , -1.70993 , -1.76728 , -1.10643 , 1.27318 , 0.0442061})
setQ({1.35243 , -1.71016 , -1.76746 , -1.1062 , 1.27347 , 0.0439783})
setQ({1.34464 , -1.71039 , -1.76765 , -1.10597 , 1.27376 , 0.0437506})
setQ({1.33684 , -1.71062 , -1.76783 , -1.10573 , 1.27405 , 0.0435228})
setQ({1.32905 , -1.71086 , -1.76801 , -1.1055 , 1.27433 , 0.043295})
setQ({1.32125 , -1.71109 , -1.7682 , -1.10527 , 1.27462 , 0.0430672})
setQ({1.31346 , -1.71132 , -1.76838 , -1.10503 , 1.27491 , 0.0428394})
setQ({1.30566 , -1.71155 , -1.76856 , -1.1048 , 1.2752 , 0.0426116})
setQ({1.29787 , -1.71178 , -1.76874 , -1.10457 , 1.27548 , 0.0423838})
setQ({1.29008 , -1.71201 , -1.76893 , -1.10433 , 1.27577 , 0.042156})
setQ({1.28228 , -1.71225 , -1.76911 , -1.1041 , 1.27606 , 0.0419283})
setQ({1.27449 , -1.71248 , -1.76929 , -1.10387 , 1.27634 , 0.0417005})
setQ({1.26669 , -1.71271 , -1.76947 , -1.10364 , 1.27663 , 0.0414727})
setQ({1.2589 , -1.71294 , -1.76966 , -1.1034 , 1.27692 , 0.0412449})
setQ({1.2511 , -1.71317 , -1.76984 , -1.10317 , 1.27721 , 0.0410171})
setQ({1.24331 , -1.7134 , -1.77002 , -1.10294 , 1.27749 , 0.0407893})
setQ({1.23551 , -1.71363 , -1.77021 , -1.1027 , 1.27778 , 0.0405615})
setQ({1.22772 , -1.71387 , -1.77039 , -1.10247 , 1.27807 , 0.0403337})
setQ({1.21992 , -1.7141 , -1.77057 , -1.10224 , 1.27836 , 0.0401059})
setQ({1.21213 , -1.71433 , -1.77075 , -1.10201 , 1.27864 , 0.0398782})
setQ({1.20433 , -1.71456 , -1.77094 , -1.10177 , 1.27893 , 0.0396504})
setQ({1.19654 , -1.71479 , -1.77112 , -1.10154 , 1.27922 , 0.0394226})
setQ({1.18874 , -1.71502 , -1.7713 , -1.10131 , 1.2795 , 0.0391948})
setQ({1.18095 , -1.71526 , -1.77148 , -1.10107 , 1.27979 , 0.038967})
setQ({1.17315 , -1.71549 , -1.77167 , -1.10084 , 1.28008 , 0.0387392})
setQ({1.16536 , -1.71572 , -1.77185 , -1.10061 , 1.28037 , 0.0385114})
setQ({1.15756 , -1.71595 , -1.77203 , -1.10038 , 1.28065 , 0.0382836})
setQ({1.14977 , -1.71618 , -1.77222 , -1.10014 , 1.28094 , 0.0380559})
setQ({1.14197 , -1.71641 , -1.7724 , -1.09991 , 1.28123 , 0.0378281})
setQ({1.13418 , -1.71665 , -1.77258 , -1.09968 , 1.28152 , 0.0376003})
setQ({1.12638 , -1.71688 , -1.77276 , -1.09944 , 1.2818 , 0.0373725})
setQ({1.11859 , -1.71711 , -1.77295 , -1.09921 , 1.28209 , 0.0371447})
setQ({1.11079 , -1.71734 , -1.77313 , -1.09898 , 1.28238 , 0.0369169})
setQ({1.103 , -1.71757 , -1.77331 , -1.09874 , 1.28266 , 0.0366891})
setQ({1.0952 , -1.7178 , -1.77349 , -1.09851 , 1.28295 , 0.0364613})
setQ({1.08741 , -1.71803 , -1.77368 , -1.09828 , 1.28324 , 0.0362336})
setQ({1.07961 , -1.71827 , -1.77386 , -1.09805 , 1.28353 , 0.0360058})
setQ({1.07182 , -1.7185 , -1.77404 , -1.09781 , 1.28381 , 0.035778})
setQ({1.06402 , -1.71873 , -1.77423 , -1.09758 , 1.2841 , 0.0355502})
setQ({1.05623 , -1.71896 , -1.77441 , -1.09735 , 1.28439 , 0.0353224})
setQ({1.04844 , -1.71919 , -1.77459 , -1.09711 , 1.28468 , 0.0350946})
setQ({1.04064 , -1.71942 , -1.77477 , -1.09688 , 1.28496 , 0.0348668})
setQ({1.03285 , -1.71966 , -1.77496 , -1.09665 , 1.28525 , 0.034639})
setQ({1.02505 , -1.71989 , -1.77514 , -1.09642 , 1.28554 , 0.0344113})
setQ({1.01726 , -1.72012 , -1.77532 , -1.09618 , 1.28582 , 0.0341835})
setQ({1.00946 , -1.72035 , -1.77551 , -1.09595 , 1.28611 , 0.0339557})
setQ({1.00167 , -1.72058 , -1.77569 , -1.09572 , 1.2864 , 0.0337279})
setQ({0.993871 , -1.72081 , -1.77587 , -1.09548 , 1.28669 , 0.0335001})
setQ({0.986076 , -1.72104 , -1.77605 , -1.09525 , 1.28697 , 0.0332723})
setQ({0.978282 , -1.72128 , -1.77624 , -1.09502 , 1.28726 , 0.0330445})
setQ({0.970487 , -1.72151 , -1.77642 , -1.09479 , 1.28755 , 0.0328167})
setQ({0.962692 , -1.72174 , -1.7766 , -1.09455 , 1.28784 , 0.032589})
setQ({0.954897 , -1.72197 , -1.77678 , -1.09432 , 1.28812 , 0.0323612})
setQ({0.947102 , -1.7222 , -1.77697 , -1.09409 , 1.28841 , 0.0321334})
setQ({0.939307 , -1.72243 , -1.77715 , -1.09385 , 1.2887 , 0.0319056})
setQ({0.931513 , -1.72267 , -1.77733 , -1.09362 , 1.28898 , 0.0316778})
setQ({0.923718 , -1.7229 , -1.77752 , -1.09339 , 1.28927 , 0.03145})
setQ({0.915923 , -1.72313 , -1.7777 , -1.09316 , 1.28956 , 0.0312222})
setQ({0.908128 , -1.72336 , -1.77788 , -1.09292 , 1.28985 , 0.0309944})
setQ({0.900333 , -1.72359 , -1.77806 , -1.09269 , 1.29013 , 0.0307666})
setQ({0.892538 , -1.72382 , -1.77825 , -1.09246 , 1.29042 , 0.0305389})
setQ({0.884744 , -1.72405 , -1.77843 , -1.09222 , 1.29071 , 0.0303111})
setQ({0.876949 , -1.72429 , -1.77861 , -1.09199 , 1.291 , 0.0300833})
setQ({0.869154 , -1.72452 , -1.77879 , -1.09176 , 1.29128 , 0.0298555})
setQ({0.861359 , -1.72475 , -1.77898 , -1.09152 , 1.29157 , 0.0296277})
setQ({0.853564 , -1.72498 , -1.77916 , -1.09129 , 1.29186 , 0.0293999})
setQ({0.845769 , -1.72521 , -1.77934 , -1.09106 , 1.29214 , 0.0291721})
setQ({0.837975 , -1.72544 , -1.77953 , -1.09083 , 1.29243 , 0.0289443})
setQ({0.83018 , -1.72568 , -1.77971 , -1.09059 , 1.29272 , 0.0287166})
setQ({0.822385 , -1.72591 , -1.77989 , -1.09036 , 1.29301 , 0.0284888})
setQ({0.81459 , -1.72614 , -1.78007 , -1.09013 , 1.29329 , 0.028261})
setQ({0.806795 , -1.72637 , -1.78026 , -1.08989 , 1.29358 , 0.0280332})
setQ({0.799 , -1.7266 , -1.78044 , -1.08966 , 1.29387 , 0.0278054})
setQ({0.791206 , -1.72683 , -1.78062 , -1.08943 , 1.29416 , 0.0275776})
setQ({0.783411 , -1.72706 , -1.7808 , -1.0892 , 1.29444 , 0.0273498})
setQ({0.775616 , -1.7273 , -1.78099 , -1.08896 , 1.29473 , 0.027122})
setQ({0.767821 , -1.72753 , -1.78117 , -1.08873 , 1.29502 , 0.0268943})
setQ({0.760026 , -1.72776 , -1.78135 , -1.0885 , 1.2953 , 0.0266665})
setQ({0.752231 , -1.72799 , -1.78154 , -1.08826 , 1.29559 , 0.0264387})
setQ({0.744436 , -1.72822 , -1.78172 , -1.08803 , 1.29588 , 0.0262109})
setQ({0.736642 , -1.72845 , -1.7819 , -1.0878 , 1.29617 , 0.0259831})
setQ({0.728847 , -1.72869 , -1.78208 , -1.08757 , 1.29645 , 0.0257553})
setQ({0.721052 , -1.72892 , -1.78227 , -1.08733 , 1.29674 , 0.0255275})
setQ({0.713257 , -1.72915 , -1.78245 , -1.0871 , 1.29703 , 0.0252997})
setQ({0.705462 , -1.72938 , -1.78263 , -1.08687 , 1.29732 , 0.025072})
setQ({0.697667 , -1.72961 , -1.78281 , -1.08663 , 1.2976 , 0.0248442})
setQ({0.689873 , -1.72984 , -1.783 , -1.0864 , 1.29789 , 0.0246164})
setQ({0.682078 , -1.73007 , -1.78318 , -1.08617 , 1.29818 , 0.0243886})
setQ({0.674283 , -1.73031 , -1.78336 , -1.08594 , 1.29846 , 0.0241608})
setQ({0.666488 , -1.73054 , -1.78355 , -1.0857 , 1.29875 , 0.023933})
setQ({0.658693 , -1.73077 , -1.78373 , -1.08547 , 1.29904 , 0.0237052})
setQ({0.650898 , -1.731 , -1.78391 , -1.08524 , 1.29933 , 0.0234774})
setQ({0.643104 , -1.73123 , -1.78409 , -1.085 , 1.29961 , 0.0232497})
setQ({0.635309 , -1.73146 , -1.78428 , -1.08477 , 1.2999 , 0.0230219})
setQ({0.627514 , -1.7317 , -1.78446 , -1.08454 , 1.30019 , 0.0227941})
setQ({0.619719 , -1.73193 , -1.78464 , -1.0843 , 1.30048 , 0.0225663})
setQ({0.611924 , -1.73216 , -1.78483 , -1.08407 , 1.30076 , 0.0223385})
setQ({0.604129 , -1.73239 , -1.78501 , -1.08384 , 1.30105 , 0.0221107})
setQ({0.596335 , -1.73262 , -1.78519 , -1.08361 , 1.30134 , 0.0218829})
setQ({0.58854 , -1.73285 , -1.78537 , -1.08337 , 1.30162 , 0.0216551})
setQ({0.580745 , -1.73308 , -1.78556 , -1.08314 , 1.30191 , 0.0214273})
setQ({0.57295 , -1.73332 , -1.78574 , -1.08291 , 1.3022 , 0.0211996})
setQ({0.565155 , -1.73355 , -1.78592 , -1.08267 , 1.30249 , 0.0209718})
setQ({0.55736 , -1.73378 , -1.7861 , -1.08244 , 1.30277 , 0.020744})
setQ({0.549566 , -1.73401 , -1.78629 , -1.08221 , 1.30306 , 0.0205162})
setQ({0.541771 , -1.73424 , -1.78647 , -1.08198 , 1.30335 , 0.0202884})
setQ({0.533976 , -1.73447 , -1.78665 , -1.08174 , 1.30364 , 0.0200606})
setQ({0.526181 , -1.73471 , -1.78684 , -1.08151 , 1.30392 , 0.0198328})
setQ({0.518386 , -1.73494 , -1.78702 , -1.08128 , 1.30421 , 0.019605})
setQ({0.510591 , -1.73517 , -1.7872 , -1.08104 , 1.3045 , 0.0193773})
setQ({0.502797 , -1.7354 , -1.78738 , -1.08081 , 1.30478 , 0.0191495})
setQ({0.495002 , -1.73563 , -1.78757 , -1.08058 , 1.30507 , 0.0189217})
setQ({0.487207 , -1.73586 , -1.78775 , -1.08035 , 1.30536 , 0.0186939})
setQ({0.479412 , -1.73609 , -1.78793 , -1.08011 , 1.30565 , 0.0184661})
setQ({0.471617 , -1.73633 , -1.78811 , -1.07988 , 1.30593 , 0.0182383})
setQ({0.463822 , -1.73656 , -1.7883 , -1.07965 , 1.30622 , 0.0180105})
setQ({0.456028 , -1.73679 , -1.78848 , -1.07941 , 1.30651 , 0.0177827})
setQ({0.448233 , -1.73702 , -1.78866 , -1.07918 , 1.3068 , 0.017555})
setQ({0.440438 , -1.73725 , -1.78885 , -1.07895 , 1.30708 , 0.0173272})
setQ({0.432643 , -1.73748 , -1.78903 , -1.07871 , 1.30737 , 0.0170994})
setQ({0.424848 , -1.73772 , -1.78921 , -1.07848 , 1.30766 , 0.0168716})
setQ({0.417053 , -1.73795 , -1.78939 , -1.07825 , 1.30794 , 0.0166438})
setQ({0.409258 , -1.73818 , -1.78958 , -1.07802 , 1.30823 , 0.016416})
setQ({0.401464 , -1.73841 , -1.78976 , -1.07778 , 1.30852 , 0.0161882})
setQ({0.393669 , -1.73864 , -1.78994 , -1.07755 , 1.30881 , 0.0159604})
setQ({0.385874 , -1.73887 , -1.79012 , -1.07732 , 1.30909 , 0.0157327})
setQ({0.378079 , -1.7391 , -1.79031 , -1.07708 , 1.30938 , 0.0155049})
setQ({0.370284 , -1.73934 , -1.79049 , -1.07685 , 1.30967 , 0.0152771})
setQ({0.362489 , -1.73957 , -1.79067 , -1.07662 , 1.30996 , 0.0150493})
setQ({0.354695 , -1.7398 , -1.79086 , -1.07639 , 1.31024 , 0.0148215})
setQ({0.3469 , -1.74003 , -1.79104 , -1.07615 , 1.31053 , 0.0145937})
setQ({0.339105 , -1.74026 , -1.79122 , -1.07592 , 1.31082 , 0.0143659})
setQ({0.33131 , -1.74049 , -1.7914 , -1.07569 , 1.3111 , 0.0141381})
setQ({0.323515 , -1.74073 , -1.79159 , -1.07545 , 1.31139 , 0.0139104})
setQ({0.31572 , -1.74096 , -1.79177 , -1.07522 , 1.31168 , 0.0136826})
setQ({0.307926 , -1.74119 , -1.79195 , -1.07499 , 1.31197 , 0.0134548})
setQ({0.300131 , -1.74142 , -1.79214 , -1.07476 , 1.31225 , 0.013227})
setQ({0.292336 , -1.74165 , -1.79232 , -1.07452 , 1.31254 , 0.0129992})
setQ({0.284541 , -1.74188 , -1.7925 , -1.07429 , 1.31283 , 0.0127714})
setQ({0.276746 , -1.74211 , -1.79268 , -1.07406 , 1.31312 , 0.0125436})
setQ({0.268951 , -1.74235 , -1.79287 , -1.07382 , 1.3134 , 0.0123158})
setQ({0.261157 , -1.74258 , -1.79305 , -1.07359 , 1.31369 , 0.012088})
setQ({0.253362 , -1.74281 , -1.79323 , -1.07336 , 1.31398 , 0.0118603})
setQ({0.245567 , -1.74304 , -1.79341 , -1.07313 , 1.31426 , 0.0116325})
setQ({0.237772 , -1.74327 , -1.7936 , -1.07289 , 1.31455 , 0.0114047})
setQ({0.229977 , -1.7435 , -1.79378 , -1.07266 , 1.31484 , 0.0111769})
setQ({0.222182 , -1.74374 , -1.79396 , -1.07243 , 1.31513 , 0.0109491})
setQ({0.214388 , -1.74397 , -1.79415 , -1.07219 , 1.31541 , 0.0107213})
setQ({0.206593 , -1.7442 , -1.79433 , -1.07196 , 1.3157 , 0.0104935})
setQ({0.198798 , -1.74443 , -1.79451 , -1.07173 , 1.31599 , 0.0102657})
setQ({0.191003 , -1.74466 , -1.79469 , -1.07149 , 1.31628 , 0.010038})
setQ({0.183208 , -1.74489 , -1.79488 , -1.07126 , 1.31656 , 0.00981017})
setQ({0.175413 , -1.74512 , -1.79506 , -1.07103 , 1.31685 , 0.00958238})
setQ({0.167619 , -1.74536 , -1.79524 , -1.0708 , 1.31714 , 0.00935459})
setQ({0.159824 , -1.74559 , -1.79542 , -1.07056 , 1.31742 , 0.00912681})
setQ({0.152029 , -1.74582 , -1.79561 , -1.07033 , 1.31771 , 0.00889902})
setQ({0.144234 , -1.74605 , -1.79579 , -1.0701 , 1.318 , 0.00867123})
setQ({0.136439 , -1.74628 , -1.79597 , -1.06986 , 1.31829 , 0.00844344})
setQ({0.128644 , -1.74651 , -1.79616 , -1.06963 , 1.31857 , 0.00821566})
setQ({0.12085 , -1.74675 , -1.79634 , -1.0694 , 1.31886 , 0.00798787})
setQ({0.113055 , -1.74698 , -1.79652 , -1.06917 , 1.31915 , 0.00776008})
setQ({0.10526 , -1.74721 , -1.7967 , -1.06893 , 1.31944 , 0.00753229})
setQ({0.097465 , -1.74744 , -1.79689 , -1.0687 , 1.31972 , 0.0073045})
setQ({0.0896702 , -1.74767 , -1.79707 , -1.06847 , 1.32001 , 0.00707672})
setQ({0.0818753 , -1.7479 , -1.79725 , -1.06823 , 1.3203 , 0.00684893})
setQ({0.0740805 , -1.74813 , -1.79743 , -1.068 , 1.32058 , 0.00662114})
setQ({0.0662856 , -1.74837 , -1.79762 , -1.06777 , 1.32087 , 0.00639335})
setQ({0.0584908 , -1.7486 , -1.7978 , -1.06754 , 1.32116 , 0.00616557})
setQ({0.050696 , -1.74883 , -1.79798 , -1.0673 , 1.32145 , 0.00593778})
setQ({0.0429011 , -1.74906 , -1.79817 , -1.06707 , 1.32173 , 0.00570999})
setQ({0.0351063 , -1.74929 , -1.79835 , -1.06684 , 1.32202 , 0.0054822})
setQ({0.0273115 , -1.74952 , -1.79853 , -1.0666 , 1.32231 , 0.00525441})
setQ({0.0195166 , -1.74976 , -1.79871 , -1.06637 , 1.3226 , 0.00502663})
setQ({0.0117218 , -1.74999 , -1.7989 , -1.06614 , 1.32288 , 0.00479884})
setQ({0.00392695 , -1.75022 , -1.79908 , -1.06591 , 1.32317 , 0.00457105})
setQ({-0.00386789 , -1.75045 , -1.79926 , -1.06567 , 1.32346 , 0.00434326})
setQ({-0.0116627 , -1.75068 , -1.79945 , -1.06544 , 1.32374 , 0.00411548})
setQ({-0.0194576 , -1.75091 , -1.79963 , -1.06521 , 1.32403 , 0.00388769})
setQ({-0.0272524 , -1.75114 , -1.79981 , -1.06497 , 1.32432 , 0.0036599})
setQ({-0.0350472 , -1.75138 , -1.79999 , -1.06474 , 1.32461 , 0.00343211})
setQ({-0.0428421 , -1.75161 , -1.80018 , -1.06451 , 1.32489 , 0.00320432})
setQ({-0.0506369 , -1.75184 , -1.80036 , -1.06427 , 1.32518 , 0.00297654})
setQ({-0.0584317 , -1.75207 , -1.80054 , -1.06404 , 1.32547 , 0.00274875})
setQ({-0.0662266 , -1.7523 , -1.80072 , -1.06381 , 1.32576 , 0.00252096})
setQ({-0.0740214 , -1.75253 , -1.80091 , -1.06358 , 1.32604 , 0.00229317})
setQ({-0.0818163 , -1.75277 , -1.80109 , -1.06334 , 1.32633 , 0.00206539})
setQ({-0.0896111 , -1.753 , -1.80127 , -1.06311 , 1.32662 , 0.0018376})
setQ({-0.0974059 , -1.75323 , -1.80146 , -1.06288 , 1.3269 , 0.00160981})
setQ({-0.105201 , -1.75346 , -1.80164 , -1.06264 , 1.32719 , 0.00138202})
setQ({-0.112996 , -1.75369 , -1.80182 , -1.06241 , 1.32748 , 0.00115423})
setQ({-0.12079 , -1.75392 , -1.802 , -1.06218 , 1.32777 , 0.000926446})
setQ({-0.128585 , -1.75415 , -1.80219 , -1.06195 , 1.32805 , 0.000698658})
setQ({-0.13638 , -1.75439 , -1.80237 , -1.06171 , 1.32834 , 0.000470871})
setQ({-0.144175 , -1.75462 , -1.80255 , -1.06148 , 1.32863 , 0.000243083})
setQ({-0.15197 , -1.75485 , -1.80273 , -1.06125 , 1.32892 , 1.5295e-05})
setQ({-0.159765 , -1.75508 , -1.80292 , -1.06101 , 1.3292 , -0.000212493})
setQ({-0.167559 , -1.75531 , -1.8031 , -1.06078 , 1.32949 , -0.000440281})
setQ({-0.175354 , -1.75554 , -1.80328 , -1.06055 , 1.32978 , -0.000668068})
setQ({-0.183149 , -1.75578 , -1.80347 , -1.06032 , 1.33006 , -0.000895856})
setQ({-0.190944 , -1.75601 , -1.80365 , -1.06008 , 1.33035 , -0.00112364})
setQ({-0.198739 , -1.75624 , -1.80383 , -1.05985 , 1.33064 , -0.00135143})
setQ({-0.206534 , -1.75647 , -1.80401 , -1.05962 , 1.33093 , -0.00157922})
setQ({-0.214328 , -1.7567 , -1.8042 , -1.05938 , 1.33121 , -0.00180701})
setQ({-0.222123 , -1.75693 , -1.80438 , -1.05915 , 1.3315 , -0.0020348})
setQ({-0.229918 , -1.75716 , -1.80456 , -1.05892 , 1.33179 , -0.00226258})
setQ({-0.237713 , -1.7574 , -1.80474 , -1.05868 , 1.33208 , -0.00249037})
setQ({-0.245508 , -1.75763 , -1.80493 , -1.05845 , 1.33236 , -0.00271816})
setQ({-0.253303 , -1.75786 , -1.80511 , -1.05822 , 1.33265 , -0.00294595})
setQ({-0.261098 , -1.75809 , -1.80529 , -1.05799 , 1.33294 , -0.00317373})
setQ({-0.268892 , -1.75832 , -1.80548 , -1.05775 , 1.33322 , -0.00340152})
setQ({-0.276687 , -1.75855 , -1.80566 , -1.05752 , 1.33351 , -0.00362931})
setQ({-0.284482 , -1.75879 , -1.80584 , -1.05729 , 1.3338 , -0.0038571})
setQ({-0.292277 , -1.75902 , -1.80602 , -1.05705 , 1.33409 , -0.00408489})
setQ({-0.300072 , -1.75925 , -1.80621 , -1.05682 , 1.33437 , -0.00431267})
setQ({-0.307867 , -1.75948 , -1.80639 , -1.05659 , 1.33466 , -0.00454046})
setQ({-0.315661 , -1.75971 , -1.80657 , -1.05636 , 1.33495 , -0.00476825})
setQ({-0.323456 , -1.75994 , -1.80675 , -1.05612 , 1.33524 , -0.00499604})
setQ({-0.331251 , -1.76017 , -1.80694 , -1.05589 , 1.33552 , -0.00522382})
setQ({-0.339046 , -1.76041 , -1.80712 , -1.05566 , 1.33581 , -0.00545161})
setQ({-0.346841 , -1.76064 , -1.8073 , -1.05542 , 1.3361 , -0.0056794})
setQ({-0.354636 , -1.76087 , -1.80749 , -1.05519 , 1.33638 , -0.00590719})
setQ({-0.36243 , -1.7611 , -1.80767 , -1.05496 , 1.33667 , -0.00613498})
setQ({-0.370225 , -1.76133 , -1.80785 , -1.05473 , 1.33696 , -0.00636276})
setQ({-0.37802 , -1.76156 , -1.80803 , -1.05449 , 1.33725 , -0.00659055})
setQ({-0.385815 , -1.7618 , -1.80822 , -1.05426 , 1.33753 , -0.00681834})
setQ({-0.39361 , -1.76203 , -1.8084 , -1.05403 , 1.33782 , -0.00704613})
setQ({-0.401405 , -1.76226 , -1.80858 , -1.05379 , 1.33811 , -0.00727391})
setQ({-0.409199 , -1.76249 , -1.80877 , -1.05356 , 1.3384 , -0.0075017})
setQ({-0.416994 , -1.76272 , -1.80895 , -1.05333 , 1.33868 , -0.00772949})
setQ({-0.424789 , -1.76295 , -1.80913 , -1.0531 , 1.33897 , -0.00795728})
setQ({-0.432584 , -1.76318 , -1.80931 , -1.05286 , 1.33926 , -0.00818507})
setQ({-0.440379 , -1.76342 , -1.8095 , -1.05263 , 1.33954 , -0.00841285})
setQ({-0.448174 , -1.76365 , -1.80968 , -1.0524 , 1.33983 , -0.00864064})
setQ({-0.455968 , -1.76388 , -1.80986 , -1.05216 , 1.34012 , -0.00886843})
setQ({-0.463763 , -1.76411 , -1.81004 , -1.05193 , 1.34041 , -0.00909622})
setQ({-0.471558 , -1.76434 , -1.81023 , -1.0517 , 1.34069 , -0.009324})
setQ({-0.479353 , -1.76457 , -1.81041 , -1.05146 , 1.34098 , -0.00955179})
setQ({-0.487148 , -1.76481 , -1.81059 , -1.05123 , 1.34127 , -0.00977958})
setQ({-0.494943 , -1.76504 , -1.81078 , -1.051 , 1.34156 , -0.0100074})
setQ({-0.502737 , -1.76527 , -1.81096 , -1.05077 , 1.34184 , -0.0102352})
setQ({-0.510532 , -1.7655 , -1.81114 , -1.05053 , 1.34213 , -0.0104629})
setQ({-0.518327 , -1.76573 , -1.81132 , -1.0503 , 1.34242 , -0.0106907})
setQ({-0.526122 , -1.76596 , -1.81151 , -1.05007 , 1.3427 , -0.0109185})
setQ({-0.533917 , -1.7662 , -1.81169 , -1.04983 , 1.34299 , -0.0111463})
setQ({-0.541712 , -1.76643 , -1.81187 , -1.0496 , 1.34328 , -0.0113741})
setQ({-0.549506 , -1.76666 , -1.81205 , -1.04937 , 1.34357 , -0.0116019})
setQ({-0.557301 , -1.76689 , -1.81224 , -1.04914 , 1.34385 , -0.0118297})
setQ({-0.565096 , -1.76712 , -1.81242 , -1.0489 , 1.34414 , -0.0120575})
setQ({-0.572891 , -1.76735 , -1.8126 , -1.04867 , 1.34443 , -0.0122852})
setQ({-0.580686 , -1.76758 , -1.81279 , -1.04844 , 1.34472 , -0.012513})
setQ({-0.588481 , -1.76782 , -1.81297 , -1.0482 , 1.345 , -0.0127408})
setQ({-0.596276 , -1.76805 , -1.81315 , -1.04797 , 1.34529 , -0.0129686})
setQ({-0.60407 , -1.76828 , -1.81333 , -1.04774 , 1.34558 , -0.0131964})
setQ({-0.611865 , -1.76851 , -1.81352 , -1.04751 , 1.34586 , -0.0134242})
setQ({-0.61966 , -1.76874 , -1.8137 , -1.04727 , 1.34615 , -0.013652})
setQ({-0.627455 , -1.76897 , -1.81388 , -1.04704 , 1.34644 , -0.0138798})
setQ({-0.63525 , -1.76921 , -1.81406 , -1.04681 , 1.34673 , -0.0141075})
setQ({-0.643045 , -1.76944 , -1.81425 , -1.04657 , 1.34701 , -0.0143353})
setQ({-0.650839 , -1.76967 , -1.81443 , -1.04634 , 1.3473 , -0.0145631})
setQ({-0.658634 , -1.7699 , -1.81461 , -1.04611 , 1.34759 , -0.0147909})
setQ({-0.666429 , -1.77013 , -1.8148 , -1.04588 , 1.34788 , -0.0150187})
setQ({-0.674224 , -1.77036 , -1.81498 , -1.04564 , 1.34816 , -0.0152465})
setQ({-0.682019 , -1.77059 , -1.81516 , -1.04541 , 1.34845 , -0.0154743})
setQ({-0.689814 , -1.77083 , -1.81534 , -1.04518 , 1.34874 , -0.0157021})
setQ({-0.697608 , -1.77106 , -1.81553 , -1.04494 , 1.34902 , -0.0159299})
setQ({-0.705403 , -1.77129 , -1.81571 , -1.04471 , 1.34931 , -0.0161576})
setQ({-0.713198 , -1.77152 , -1.81589 , -1.04448 , 1.3496 , -0.0163854})
setQ({-0.720993 , -1.77175 , -1.81608 , -1.04424 , 1.34989 , -0.0166132})
setQ({-0.728788 , -1.77198 , -1.81626 , -1.04401 , 1.35017 , -0.016841})
setQ({-0.736583 , -1.77222 , -1.81644 , -1.04378 , 1.35046 , -0.0170688})
setQ({-0.744377 , -1.77245 , -1.81662 , -1.04355 , 1.35075 , -0.0172966})
setQ({-0.752172 , -1.77268 , -1.81681 , -1.04331 , 1.35104 , -0.0175244})
setQ({-0.759967 , -1.77291 , -1.81699 , -1.04308 , 1.35132 , -0.0177522})
setQ({-0.767762 , -1.77314 , -1.81717 , -1.04285 , 1.35161 , -0.0179799})
setQ({-0.775557 , -1.77337 , -1.81735 , -1.04261 , 1.3519 , -0.0182077})
setQ({-0.783352 , -1.7736 , -1.81754 , -1.04238 , 1.35218 , -0.0184355})
setQ({-0.791146 , -1.77384 , -1.81772 , -1.04215 , 1.35247 , -0.0186633})
setQ({-0.798941 , -1.77407 , -1.8179 , -1.04192 , 1.35276 , -0.0188911})
setQ({-0.806736 , -1.7743 , -1.81809 , -1.04168 , 1.35305 , -0.0191189})
setQ({-0.814531 , -1.77453 , -1.81827 , -1.04145 , 1.35333 , -0.0193467})
setQ({-0.822326 , -1.77476 , -1.81845 , -1.04122 , 1.35362 , -0.0195745})
setQ({-0.830121 , -1.77499 , -1.81863 , -1.04098 , 1.35391 , -0.0198022})
setQ({-0.837915 , -1.77523 , -1.81882 , -1.04075 , 1.3542 , -0.02003})
setQ({-0.84571 , -1.77546 , -1.819 , -1.04052 , 1.35448 , -0.0202578})
setQ({-0.853505 , -1.77569 , -1.81918 , -1.04029 , 1.35477 , -0.0204856})
setQ({-0.8613 , -1.77592 , -1.81936 , -1.04005 , 1.35506 , -0.0207134})
setQ({-0.869095 , -1.77615 , -1.81955 , -1.03982 , 1.35534 , -0.0209412})
setQ({-0.87689 , -1.77638 , -1.81973 , -1.03959 , 1.35563 , -0.021169})
setQ({-0.884685 , -1.77661 , -1.81991 , -1.03935 , 1.35592 , -0.0213968})
setQ({-0.892479 , -1.77685 , -1.8201 , -1.03912 , 1.35621 , -0.0216245})
setQ({-0.900274 , -1.77708 , -1.82028 , -1.03889 , 1.35649 , -0.0218523})
setQ({-0.908069 , -1.77731 , -1.82046 , -1.03865 , 1.35678 , -0.0220801})
setQ({-0.915864 , -1.77754 , -1.82064 , -1.03842 , 1.35707 , -0.0223079})
setQ({-0.923659 , -1.77777 , -1.82083 , -1.03819 , 1.35736 , -0.0225357})
setQ({-0.931454 , -1.778 , -1.82101 , -1.03796 , 1.35764 , -0.0227635})
setQ({-0.939248 , -1.77824 , -1.82119 , -1.03772 , 1.35793 , -0.0229913})
setQ({-0.947043 , -1.77847 , -1.82137 , -1.03749 , 1.35822 , -0.0232191})
setQ({-0.954838 , -1.7787 , -1.82156 , -1.03726 , 1.3585 , -0.0234468})
setQ({-0.962633 , -1.77893 , -1.82174 , -1.03702 , 1.35879 , -0.0236746})
setQ({-0.970428 , -1.77916 , -1.82192 , -1.03679 , 1.35908 , -0.0239024})
setQ({-0.978223 , -1.77939 , -1.82211 , -1.03656 , 1.35937 , -0.0241302})
setQ({-0.986017 , -1.77962 , -1.82229 , -1.03633 , 1.35965 , -0.024358})
setQ({-0.993812 , -1.77986 , -1.82247 , -1.03609 , 1.35994 , -0.0245858})
setQ({-1.00161 , -1.78009 , -1.82265 , -1.03586 , 1.36023 , -0.0248136})
setQ({-1.0094 , -1.78032 , -1.82284 , -1.03563 , 1.36052 , -0.0250414})
setQ({-1.0172 , -1.78055 , -1.82302 , -1.03539 , 1.3608 , -0.0252692})
setQ({-1.02499 , -1.78078 , -1.8232 , -1.03516 , 1.36109 , -0.0254969})
setQ({-1.03279 , -1.78101 , -1.82338 , -1.03493 , 1.36138 , -0.0257247})
setQ({-1.04058 , -1.78125 , -1.82357 , -1.0347 , 1.36166 , -0.0259525})
setQ({-1.04838 , -1.78148 , -1.82375 , -1.03446 , 1.36195 , -0.0261803})
setQ({-1.05617 , -1.78171 , -1.82393 , -1.03423 , 1.36224 , -0.0264081})
setQ({-1.06397 , -1.78194 , -1.82412 , -1.034 , 1.36253 , -0.0266359})
setQ({-1.07176 , -1.78217 , -1.8243 , -1.03376 , 1.36281 , -0.0268637})
setQ({-1.07956 , -1.7824 , -1.82448 , -1.03353 , 1.3631 , -0.0270915})
setQ({-1.08735 , -1.78263 , -1.82466 , -1.0333 , 1.36339 , -0.0273192})
setQ({-1.09515 , -1.78287 , -1.82485 , -1.03307 , 1.36368 , -0.027547})
setQ({-1.10294 , -1.7831 , -1.82503 , -1.03283 , 1.36396 , -0.0277748})
setQ({-1.11073 , -1.78333 , -1.82521 , -1.0326 , 1.36425 , -0.0280026})
setQ({-1.11853 , -1.78356 , -1.8254 , -1.03237 , 1.36454 , -0.0282304})
setQ({-1.12632 , -1.78379 , -1.82558 , -1.03213 , 1.36482 , -0.0284582})
setQ({-1.13412 , -1.78402 , -1.82576 , -1.0319 , 1.36511 , -0.028686})
setQ({-1.14191 , -1.78426 , -1.82594 , -1.03167 , 1.3654 , -0.0289138})
setQ({-1.14971 , -1.78449 , -1.82613 , -1.03143 , 1.36569 , -0.0291415})
setQ({-1.1575 , -1.78472 , -1.82631 , -1.0312 , 1.36597 , -0.0293693})
setQ({-1.1653 , -1.78495 , -1.82649 , -1.03097 , 1.36626 , -0.0295971})
setQ({-1.17309 , -1.78518 , -1.82667 , -1.03074 , 1.36655 , -0.0298249})
setQ({-1.18089 , -1.78541 , -1.82686 , -1.0305 , 1.36684 , -0.0300527})
setQ({-1.18868 , -1.78564 , -1.82704 , -1.03027 , 1.36712 , -0.0302805})
setQ({-1.19648 , -1.78588 , -1.82722 , -1.03004 , 1.36741 , -0.0305083})
setQ({-1.20427 , -1.78611 , -1.82741 , -1.0298 , 1.3677 , -0.0307361})
setQ({-1.21207 , -1.78634 , -1.82759 , -1.02957 , 1.36798 , -0.0309638})
setQ({-1.21696 , -1.78648 , -1.8277 , -1.02943 , 1.36817 , -0.0311069})
setQ({-1.21497 , -1.78602 , -1.83268 , -1.02557 , 1.3717 , -0.0332735})
setQ({-1.21412 , -1.78478 , -1.8386 , -1.02282 , 1.37493 , -0.0356755})
setQ({-1.21365 , -1.78359 , -1.84394 , -1.02029 , 1.37751 , -0.0399034})
setQ({-1.21325 , -1.78547 , -1.84301 , -1.01373 , 1.37645 , -0.0434219})
setQ({-1.20953 , -1.78874 , -1.84161 , -1.01112 , 1.37904 , -0.0480011})
setQ({-1.20768 , -1.78888 , -1.84258 , -1.00987 , 1.38625 , -0.0462128})
setQ({-1.20893 , -1.79053 , -1.8454 , -1.00728 , 1.39162 , -0.0498573})
setQ({-1.20714 , -1.7925 , -1.84815 , -1.0078 , 1.39716 , -0.0537803})
setQ({-1.20762 , -1.79371 , -1.85162 , -1.0069 , 1.40309 , -0.057144})
setQ({-1.20578 , -1.79531 , -1.85441 , -1.00562 , 1.4088 , -0.0607586})
setQ({-1.20633 , -1.79427 , -1.85865 , -1.0007 , 1.41256 , -0.0589428})
setQ({-1.20534 , -1.79067 , -1.86373 , -0.999318 , 1.41638 , -0.0567401})
setQ({-1.20579 , -1.79313 , -1.86721 , -1.00077 , 1.41898 , -0.0509244})
setQ({-1.20558 , -1.79089 , -1.87099 , -1.0018 , 1.42488 , -0.0485028})
setQ({-1.20577 , -1.7904 , -1.87221 , -0.997698 , 1.42998 , -0.0444442})
setQ({-1.20182 , -1.78773 , -1.87704 , -0.995323 , 1.43188 , -0.0468218})
setQ({-1.19985 , -1.78886 , -1.88271 , -0.995645 , 1.43576 , -0.0438741})
setQ({-1.1992 , -1.78911 , -1.88696 , -0.990771 , 1.43788 , -0.0401068})
setQ({-1.20005 , -1.79041 , -1.88743 , -0.986783 , 1.44284 , -0.035875})
setQ({-1.19942 , -1.79047 , -1.88885 , -0.982767 , 1.44881 , -0.0384988})
setQ({-1.19944 , -1.7914 , -1.89338 , -0.977314 , 1.44796 , -0.0354761})
setQ({-1.20101 , -1.79331 , -1.89529 , -0.977376 , 1.45348 , -0.0309171})
setQ({-1.20003 , -1.79468 , -1.90054 , -0.971884 , 1.45284 , -0.0311635})
setQ({-1.19575 , -1.79437 , -1.90327 , -0.970413 , 1.45458 , -0.0256875})
setQ({-1.19571 , -1.7951 , -1.90131 , -0.967617 , 1.46157 , -0.0259531})
setQ({-1.1955 , -1.79804 , -1.90629 , -0.964452 , 1.46434 , -0.0290925})
setQ({-1.1964 , -1.79886 , -1.90803 , -0.964907 , 1.47128 , -0.0319453})
setQ({-1.1954 , -1.80048 , -1.90926 , -0.961849 , 1.47538 , -0.0264901})
setQ({-1.19495 , -1.79969 , -1.91197 , -0.958083 , 1.48155 , -0.0257558})
setQ({-1.19181 , -1.80165 , -1.91203 , -0.957674 , 1.48823 , -0.0241522})
setQ({-1.18826 , -1.80517 , -1.91324 , -0.955231 , 1.49338 , -0.0226958})
setQ({-1.18646 , -1.80596 , -1.91353 , -0.948561 , 1.49509 , -0.0258072})
setQ({-1.18437 , -1.80797 , -1.91679 , -0.94561 , 1.50086 , -0.025632})
setQ({-1.18203 , -1.80627 , -1.91891 , -0.939898 , 1.50444 , -0.0240017})
setQ({-1.17955 , -1.80693 , -1.91939 , -0.93525 , 1.51002 , -0.0252333})
setQ({-1.17917 , -1.80795 , -1.9228 , -0.931178 , 1.51344 , -0.0207719})
setQ({-1.17757 , -1.80966 , -1.92638 , -0.9268 , 1.51718 , -0.0176672})
setQ({-1.17484 , -1.80788 , -1.93101 , -0.927505 , 1.52229 , -0.0161164})
setQ({-1.17123 , -1.81198 , -1.93223 , -0.926233 , 1.52759 , -0.0159816})
setQ({-1.17055 , -1.81261 , -1.93675 , -0.922033 , 1.53098 , -0.0192345})
setQ({-1.16997 , -1.81152 , -1.94257 , -0.924404 , 1.53172 , -0.023653})
setQ({-1.16947 , -1.81024 , -1.94903 , -0.924201 , 1.5313 , -0.0195079})
setQ({-1.16659 , -1.81054 , -1.95412 , -0.92812 , 1.53187 , -0.0161815})
setQ({-1.16643 , -1.80933 , -1.95504 , -0.928174 , 1.53886 , -0.0130494})
setQ({-1.16427 , -1.80876 , -1.96146 , -0.92832 , 1.54132 , -0.0100854})
setQ({-1.16519 , -1.80602 , -1.96441 , -0.927771 , 1.54782 , -0.00886197})
setQ({-1.16567 , -1.80498 , -1.97035 , -0.931634 , 1.54685 , -0.0117899})
setQ({-1.16583 , -1.80341 , -1.97568 , -0.929085 , 1.55164 , -0.0126254})
setQ({-1.16622 , -1.80296 , -1.98098 , -0.926195 , 1.55611 , -0.0146794})
setQ({-1.16591 , -1.80164 , -1.98468 , -0.92751 , 1.56272 , -0.0150376})
setQ({-1.16265 , -1.79933 , -1.98954 , -0.931369 , 1.5653 , -0.0150174})
setQ({-1.16004 , -1.79725 , -1.99223 , -0.928735 , 1.57064 , -0.012331})
setQ({-1.15743 , -1.79614 , -1.99406 , -0.930584 , 1.57197 , -0.00566119})
setQ({-1.154 , -1.798 , -1.993 , -0.934 , 1.571 , 0})
