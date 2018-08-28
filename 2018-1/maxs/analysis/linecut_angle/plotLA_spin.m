close all

f1 = figure;
f2 = figure;
f3 = figure;
f4 = figure;

figure(f1)
plot(MAPLE2_NA.chi,MAPLE2_NA.I)
hold on

plot(MAPLE3_NA.chi,MAPLE3_NA.I)
plot(MAPLE4_NA.chi,MAPLE4_NA.I)
plot(MAPLE5_NA.chi,MAPLE5_NA.I)
hold off

figure(f2)
plot(MAPLE2_110C.chi,MAPLE2_110C.I)
hold on

plot(MAPLE3_110C.chi,MAPLE3_110C.I)
plot(MAPLE4_110C.chi,MAPLE4_110C.I)
plot(MAPLE5_110C.chi,MAPLE5_110C.I)
hold off

figure(f3)
plot(MAPLE2_NA.chi,MAPLE2_NA.I.*sind(MAPLE2_NA.chi))
hold on

plot(MAPLE3_NA.chi,MAPLE3_NA.I.*sind(MAPLE3_NA.chi))
plot(MAPLE4_NA.chi,MAPLE4_NA.I.*sind(MAPLE4_NA.chi))
plot(MAPLE5_NA.chi,MAPLE5_NA.I.*sind(MAPLE5_NA.chi))
hold off

figure(f4)
plot(MAPLE2_110C.chi,MAPLE2_110C.I.*sind(MAPLE2_110C.chi))
hold on

plot(MAPLE3_110C.chi,MAPLE3_110C.I.*sind(MAPLE3_110C.chi))
plot(MAPLE4_110C.chi,MAPLE4_110C.I.*sind(MAPLE4_110C.chi))
plot(MAPLE5_110C.chi,MAPLE5_110C.I.*sind(MAPLE5_110C.chi))
hold off

figure(f1)
hold off
title('MAPLE No Anneal Azimuthal Linecut')
legend('MAPLE2','MAPLE3','MAPLE4','MAPLE5')
% xlim([0 inf])
savefig('./processed_imgs/MAPLE_NA_AL')
print('./processed_imgs/MAPLE_NA_AL','-dpng','-r300','-f1')

figure(f2)
hold off
title('MAPLE 110C Azimuthal Linecut')
legend('MAPLE2','MAPLE3','MAPLE4','MAPLE5')
% xlim([0 inf])
savefig('./processed_imgs/MAPLE_110C_AL')
print('./processed_imgs/MAPLE_110C_AL','-dpng','-r300','-f2')

figure(f3)
hold off
title('MAPLE No Anneal Azimuthal Linecut (sin normalized)')
legend('MAPLE2','MAPLE3','MAPLE4','MAPLE5')
xlim([0 inf])
savefig('./processed_imgs/MAPLE_NA_sin_AL')
print('./processed_imgs/MAPLE_NA_sin_AL','-dpng','-r300','-f3')

figure(f4)
hold off
title('MAPLE 110C Azimuthal Linecut (sin normalized)')
legend('MAPLE2','MAPLE3','MAPLE4','MAPLE5')
xlim([0 inf])
savefig('./processed_imgs/MAPLE_110C_sin_AL')
print('./processed_imgs/MAPLE_110C_sin_AL','-dpng','-r300','-f4')