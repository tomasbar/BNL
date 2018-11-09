directory = dir('./');
f1 = figure
f2 = figure
f3 = figure
f4 = figure
% f5 = figure
% f6 = figure

for ii = 3:6
    NA(ii-2) = XRDMLread(sprintf('./%s/No anneal Wiley_quick gonio scan_4.xrdml',directory(ii).name));
    ANNEAL(ii-2) = XRDMLread(sprintf('./%s/110C Wiley_quick gonio scan_4.xrdml',directory(ii).name));    
end

% for ii = 15:21
%     NA(ii-12) = XRDMLread(sprintf('./%s/NA Wiley_quick gonio scan_5.xrdml',directory(ii).name));
%     ANNEAL(ii-12) = XRDMLread(sprintf('./%s/110C Wiley_quick gonio scan_5.xrdml',directory(ii).name));
% end

figure(f1)
plot(NA(1).Theta2,NA(1).data)
hold on
plot(ANNEAL(1).Theta2,ANNEAL(1).data)
title('x1.5 Concentration All XRD')
legend('No Anneal','110C')
xlim([NA(1).Theta2(1) NA(1).Theta2(1997)])
savefig('./processed_imgs/highall_XRD2')
print('./processed_imgs/highall_XRD2','-dpng','-r300','-f1')
hold off

figure(f2)
plot(NA(2).Theta2,NA(2).data)
hold on
plot(ANNEAL(2).Theta2,ANNEAL(2).data)
title('Baseline XRD')
legend('No Anneal','110C')
xlim([NA(1).Theta2(1) NA(1).Theta2(1997)])
savefig('./processed_imgs/baseline_XRD2')
print('./processed_imgs/baseline_XRD2','-dpng','-r300','-f2')
hold off

figure(f3)
plot(NA(3).Theta2,NA(3).data)
hold on
plot(ANNEAL(3).Theta2,ANNEAL(3).data)
title('x1.5 Concentration Inorganic XRD')
legend('No Anneal','110C')
xlim([NA(1).Theta2(1) NA(1).Theta2(1997)])
savefig('./processed_imgs/highinorg_XRD2')
print('./processed_imgs/highinorg_XRD2','-dpng','-r300','-f3')
hold off

figure(f4)
plot(NA(4).Theta2,NA(4).data)
hold on
plot(ANNEAL(4).Theta2,ANNEAL(4).data)
title('x1.5 Concentration Organic XRD')
legend('No Anneal','110C')
xlim([NA(1).Theta2(1) NA(1).Theta2(1997)])
savefig('./processed_imgs/highorg_XRD2')
print('./processed_imgs/highorg_XRD2','-dpng','-r300','-f4')
hold off


% figure(f2)
% plot(NA(2).Theta2,NA(2).data)
% hold on
% plot(NA(6).Theta2,NA(6).data)
% plot(NA(5).Theta2,NA(5).data)
% title('Sequential x1 No Anneal XRD')
% legend('Uncontrolled','25C','75C')
% xlim([NA(1).Theta2(1) NA(1).Theta2(779)])
% savefig('./processed_imgs/Sequential_XRD2')
% print('./processed_imgs/Sequential_XRD2','-dpng','-r300','-f2')
% hold off
% 
% figure(f3)
% plot(NA(1).Theta2,NA(1).data)
% hold on
% plot(NA(9).Theta2,NA(9).data)
% plot(NA(7).Theta2,NA(7).data)
% title('Layered x1 No Anneal XRD')
% legend('Uncontrolled','25C','75C')
% xlim([NA(1).Theta2(1) NA(1).Theta2(779)])
% savefig('./processed_imgs/Layered_XRD2')
% print('./processed_imgs/Layered_XRD2','-dpng','-r300','-f3')
% hold off
% 
% figure(f4)
% plot(ANNEAL(3).Theta2,ANNEAL(3).data)
% hold on
% plot(ANNEAL(8).Theta2,ANNEAL(8).data)
% plot(ANNEAL(4).Theta2,ANNEAL(4).data)
% title('Simultaneous x2 110C XRD')
% legend('Uncontrolled','25C','75C')
% xlim([NA(1).Theta2(1) NA(1).Theta2(779)])
% savefig('./processed_imgs/Simultaneous_110C_XRD2')
% print('./processed_imgs/Simultaneous_110C_XRD2','-dpng','-r300','-f4')
% hold off
% 
% 
% figure(f5)
% plot(ANNEAL(2).Theta2,ANNEAL(2).data)
% hold on
% plot(ANNEAL(6).Theta2,ANNEAL(6).data)
% plot(ANNEAL(5).Theta2,ANNEAL(5).data)
% title('Sequential x1 110C XRD')
% legend('Uncontrolled','25C','75C')
% xlim([NA(1).Theta2(1) NA(1).Theta2(779)])
% savefig('./processed_imgs/Sequential_110C_XRD2')
% print('./processed_imgs/Sequential_110C_XRD2','-dpng','-r300','-f5')
% hold off
% 
% figure(f6)
% plot(ANNEAL(1).Theta2,ANNEAL(1).data)
% hold on
% plot(ANNEAL(9).Theta2,ANNEAL(9).data)
% plot(ANNEAL(7).Theta2,ANNEAL(7).data)
% title('Layered x1 110C XRD')
% legend('Uncontrolled','25C','75C')
% xlim([NA(1).Theta2(1) NA(1).Theta2(779)])
% savefig('./processed_imgs/Layered_110C_XRD2')
% print('./processed_imgs/Layered_110C_XRD2','-dpng','-r300','-f6')
% hold off


clear all
close all