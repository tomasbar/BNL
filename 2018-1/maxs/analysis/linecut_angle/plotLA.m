close all

f1 = figure;
f2 = figure;
f3 = figure;
f4 = figure;

figure(f1)
plot(MAPLE2_NA.chi,sind(MAPLE2_NA.chi).*MAPLE2_NA.I)
hold on
plot(MAPLE2_110C.chi,sind(MAPLE2_110C.chi).*MAPLE2_110C.I)
hold off

figure(f2)
plot(MAPLE3_NA.chi,sind(MAPLE3_NA.chi).*MAPLE3_NA.I)
hold on
plot(MAPLE3_110C.chi,sind(MAPLE3_110C.chi).*MAPLE3_110C.I)
hold off

figure(f3)
plot(MAPLE4_NA.chi,sind(MAPLE4_NA.chi).*MAPLE4_NA.I)
hold on
plot(MAPLE4_110C.chi,sind(MAPLE4_110C.chi).*MAPLE4_110C.I)
hold off

figure(f4)
plot(MAPLE5_NA.chi,sind(MAPLE5_NA.chi).*MAPLE5_NA.I)
hold on
plot(MAPLE5_110C.chi,sind(MAPLE5_110C.chi).*MAPLE5_110C.I)
hold off

figure(f1)
hold off
title('x1.5 Concentration All Azimuthal Linecut')
legend('No Anneal','110C')
xlim([0 inf])
savefig('./processed_imgs/highall_sin_AL')
print('./processed_imgs/highall_sin_AL','-dpng','-r300','-f1')

figure(f2)
hold off
title('Baseline Azimuthal Linecut')
legend('No Anneal','110C')
xlim([0 inf])
savefig('./processed_imgs/baseline_sin_AL')
print('./processed_imgs/baseline_sin_AL','-dpng','-r300','-f2')

figure(f3)
hold off
title('x1.5 Concentration Inorganic Azimuthal Linecut')
legend('No Anneal','110C')
xlim([0 inf])
savefig('./processed_imgs/highinorganic_sin_AL')
print('./processed_imgs/highinorganic_sin_AL','-dpng','-r300','-f3')

figure(f4)
hold off
title('x1.5 Concentration Organic Azimuthal Linecut (sin normalized)')
legend('No Anneal','110C')
xlim([0 inf])
savefig('./processed_imgs/highorganic_sin_AL')
print('./processed_imgs/highorganic_sin_AL','-dpng','-r300','-f4')