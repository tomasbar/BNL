close all

f1 = figure;
f2 = figure;
f3 = figure;
f4 = figure;

figure(f1)
plot(SpinA_noMEG_NA.chi,SpinA_noMEG_NA.I)
hold on

plot(SpinB_noMEG_NA.chi,SpinB_noMEG_NA.I)
plot(SpinC_noMEG_NA.chi,SpinC_noMEG_NA.I)
plot(SpinD_noMEG_NA.chi,SpinD_noMEG_NA.I)
hold off

figure(f2)
plot(SpinA_noMEG_110.chi,SpinA_noMEG_110.I)
hold on

plot(SpinB_noMEG_110.chi,SpinB_noMEG_110.I)
plot(SpinC_noMEG_110.chi,SpinC_noMEG_110.I)
plot(SpinD_noMEG_110.chi,SpinD_noMEG_110.I)
hold off

figure(f3)
plot(SpinA_noMEG_NA.chi,SpinA_noMEG_NA.I.*sind(SpinA_noMEG_NA.chi))
hold on

plot(SpinB_noMEG_NA.chi,SpinB_noMEG_NA.I.*sind(SpinB_noMEG_NA.chi))
plot(SpinC_noMEG_NA.chi,SpinC_noMEG_NA.I.*sind(SpinC_noMEG_NA.chi))
plot(SpinD_noMEG_NA.chi,SpinD_noMEG_NA.I.*sind(SpinD_noMEG_NA.chi))
hold off

figure(f4)
plot(SpinA_noMEG_110.chi,SpinA_noMEG_110.I.*sind(SpinA_noMEG_110.chi))
hold on

plot(SpinB_noMEG_110.chi,SpinB_noMEG_110.I.*sind(SpinB_noMEG_110.chi))
plot(SpinC_noMEG_110.chi,SpinC_noMEG_110.I.*sind(SpinC_noMEG_110.chi))
plot(SpinD_noMEG_110.chi,SpinD_noMEG_110.I.*sind(SpinD_noMEG_110.chi))
hold off

figure(f1)
hold off
title('Spin no MEG No Anneal q=1 Azimuthal Linecut')
legend('SpinA','SpinB','SpinC','SpinD')
% xlim([0 inf])
savefig('./processed_imgs/Spin_noMEG_NA_AL')
print('./processed_imgs/Spin_noMEG_NA_AL','-dpng','-r300','-f1')

figure(f2)
hold off
title('Spin no MEG 110C q=1 Azimuthal Linecut')
legend('SpinA','SpinB','SpinC','SpinD')
% xlim([0 inf])
savefig('./processed_imgs/Spin_noMEG_110C_AL')
print('./processed_imgs/Spin_noMEG_110C_AL','-dpng','-r300','-f2')

figure(f3)
hold off
title('Spin no MEG No Anneal q=1 Azimuthal Linecut (sin normalized)')
legend('SpinA','SpinB','SpinC','SpinD')
xlim([0 inf])
savefig('./processed_imgs/Spin_noMEG_NA_sin_AL')
print('./processed_imgs/Spin_noMEG_NA_sin_AL','-dpng','-r300','-f3')

figure(f4)
hold off
title('Spin no MEG 110C q=1 Azimuthal Linecut (sin normalized)')
legend('SpinA','SpinB','SpinC','SpinD')
xlim([0 inf])
savefig('./processed_imgs/Spin_noMEG_110C_sin_AL')
print('./processed_imgs/Spin_noMEG_110C_sin_AL','-dpng','-r300','-f4')