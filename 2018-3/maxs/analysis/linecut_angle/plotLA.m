%% Plot SIMULTANEOUS MAPLE circular averages

%Sample identifiers
ID_MAPLE_SIM = ["007","013","008"];

f1 = figure;
f2 = figure;
f3 = figure;
f4 = figure;

%Step thru SIM MAPLE samples, by identifier in ID_MAPLE
for ii = 1:length(ID_MAPLE_SIM)
    
    %Load sample filenames to be plotted
    file_NA = dir(sprintf('%s-NA_th0.220*.dat',ID_MAPLE_SIM(ii)));
    file_ANNEAL = dir(sprintf('%s-110C_th0.220*.dat',ID_MAPLE_SIM(ii)));
    
    if length(file_NA) > 1
        error('TOO MANY DATA POINTS, CHECK FOR DUPLICATES')
        exit
    end
    
    if length(file_ANNEAL) > 1
        error('TOO MANY DATA POINTS, CHECK FOR DUPLICATES')
        exit
    end
    
    [chi_NA(:,ii), Iq_NA(:,ii)] = importLA(file_NA.name);
    [chi_ANNEAL(:,ii), Iq_ANNEAL(:,ii)] = importLA(file_ANNEAL.name);
    
    Iq_ANNEAL(:,ii) = flip(Iq_ANNEAL(:,ii));
    Iq_NA(:,ii) = flip(Iq_NA(:,ii));
    chi_NA(:,ii) = flip(chi_NA(:,ii));
    chi_ANNEAL(:,ii) = flip(chi_ANNEAL(:,ii));
    chi_NA(:,ii) = chi_NA(:,ii).*-1;
    chi_ANNEAL(:,ii) = chi_ANNEAL(:,ii).*-1;
    
    figure(f1)
    plot(chi_NA(:,ii),Iq_NA(:,ii),'LineWidth',1.5)
    hold on
    
    figure(f2)
    plot(chi_ANNEAL(:,ii),Iq_ANNEAL(:,ii),'LineWidth',1.5)
    hold on
    
    figure(f3)
    plot(chi_NA(:,ii),Iq_NA(:,ii).*sind(chi_NA(:,ii)),'LineWidth',1.5)
    hold on
    
    figure(f4)
    plot(chi_ANNEAL(:,ii),Iq_ANNEAL(:,ii).*sind(chi_ANNEAL(:,ii)),'LineWidth',1.5)
    hold on
end

figure(f1)
hold off
title('Simultaneous x2 No Anneal Azimuthal Linecut')
legend('Uncontrolled','25C','75C')
savefig('./processed_imgs/Simultaneous_NA_LA')
print('./processed_imgs/Simultaneous_NA_LA','-dpng','-r300','-f1')

figure(f2)
hold off
title('Simultaneous x2 110C Azimuthal Linecut')
legend('Uncontrolled','25C','75C')
savefig('./processed_imgs/Simultaneous_ANNEAL_LA')
print('./processed_imgs/Simultaneous_ANNEAL_LA','-dpng','-r300','-f2')

figure(f3)
hold off
title('Simultaneous x2 No Anneal Azimuthal Linecut Sin Normalized')
legend('Uncontrolled','25C','75C','Location','southeast')
savefig('./processed_imgs/Simultaneous_NA_LA_sin')
print('./processed_imgs/Simultaneous_NA_LA_sinL','-dpng','-r300','-f3')

figure(f4)
hold off
title('Simultaneous x2 110C Azimuthal Linecut Sin Normalized')
legend('Uncontrolled','25C','75C','Location','southeast')
savefig('./processed_imgs/Simultaneous_ANNEAL_LA_sin')
print('./processed_imgs/Simultaneous_ANNEAL_LA_sin','-dpng','-r300','-f4')

close all
clear all

%% SEQUENTIAL
ID_MAPLE_SEQ = ["005","011","010"];

f1 = figure;
f2 = figure;
f3 = figure;
f4 = figure;

%Step thru SIM MAPLE samples, by identifier in ID_MAPLE
for ii = 1:length(ID_MAPLE_SEQ)
    
    %Load sample filenames to be plotted
    file_NA = dir(sprintf('%s-NA_th0.220*.dat',ID_MAPLE_SEQ(ii)));
    file_ANNEAL = dir(sprintf('%s-110C_th0.220*.dat',ID_MAPLE_SEQ(ii)));
    
    if length(file_NA) > 1
        error('TOO MANY DATA POINTS, CHECK FOR DUPLICATES')
        exit
    end
    
    if length(file_ANNEAL) > 1
        error('TOO MANY DATA POINTS, CHECK FOR DUPLICATES')
        exit
    end
    
    [chi_NA(:,ii), Iq_NA(:,ii)] = importLA(file_NA.name);
    [chi_ANNEAL(:,ii), Iq_ANNEAL(:,ii)] = importLA(file_ANNEAL.name);
    
    Iq_ANNEAL(:,ii) = flip(Iq_ANNEAL(:,ii));
    Iq_NA(:,ii) = flip(Iq_NA(:,ii));
    chi_NA(:,ii) = flip(chi_NA(:,ii));
    chi_ANNEAL(:,ii) = flip(chi_ANNEAL(:,ii));
    chi_NA(:,ii) = chi_NA(:,ii).*-1;
    chi_ANNEAL(:,ii) = chi_ANNEAL(:,ii).*-1;
    
    figure(f1)
    plot(chi_NA(:,ii),Iq_NA(:,ii),'LineWidth',1.5)
    hold on
    
    figure(f2)
    plot(chi_ANNEAL(:,ii),Iq_ANNEAL(:,ii),'LineWidth',1.5)
    hold on
    
    figure(f3)
    plot(chi_NA(:,ii),Iq_NA(:,ii).*sind(chi_NA(:,ii)),'LineWidth',1.5)
    hold on
    
    figure(f4)
    plot(chi_ANNEAL(:,ii),Iq_ANNEAL(:,ii).*sind(chi_ANNEAL(:,ii)),'LineWidth',1.5)
    hold on
end

figure(f1)
hold off
title('Sequential x1 No Anneal Azimuthal Linecut')
legend('Uncontrolled','25C','75C')
savefig('./processed_imgs/Sequential_NA_LA')
print('./processed_imgs/Sequential_NA_LA','-dpng','-r300','-f1')

figure(f2)
hold off
title('Sequential x1 110C Azimuthal Linecut')
legend('Uncontrolled','25C','75C')
savefig('./processed_imgs/Sequential_ANNEAL_LA')
print('./processed_imgs/Sequential_ANNEAL_LA','-dpng','-r300','-f2')

figure(f3)
hold off
title('Sequential x1 No Anneal Azimuthal Linecut Sin Normalized')
legend('Uncontrolled','25C','75C','Location','southeast')
savefig('./processed_imgs/Sequential_NA_LA_sin')
print('./processed_imgs/Sequential_NA_LA_sinL','-dpng','-r300','-f3')

figure(f4)
hold off
title('Sequential x1 110C Azimuthal Linecut Sin Normalized')
legend('Uncontrolled','25C','75C','Location','southeast')
savefig('./processed_imgs/Sequential_ANNEAL_LA_sin')
print('./processed_imgs/Sequential_ANNEAL_LA_sin','-dpng','-r300','-f4')

close all
clear all
%% LAYERED
ID_MAPLE_LAY = ["003","014","012"];

f1 = figure;
f2 = figure;
f3 = figure;
f4 = figure;

%Step thru SIM MAPLE samples, by identifier in ID_MAPLE
for ii = 1:length(ID_MAPLE_LAY)
    
    %Load sample filenames to be plotted
    file_NA = dir(sprintf('%s-NA_th0.220*.dat',ID_MAPLE_LAY(ii)));
    file_ANNEAL = dir(sprintf('%s-110C_th0.220*.dat',ID_MAPLE_LAY(ii)));
    
    if length(file_NA) > 1
        error('TOO MANY DATA POINTS, CHECK FOR DUPLICATES')
        exit
    end
    
    if length(file_ANNEAL) > 1
        error('TOO MANY DATA POINTS, CHECK FOR DUPLICATES')
        exit
    end
    
    [chi_NA(:,ii), Iq_NA(:,ii)] = importLA(file_NA.name);
    [chi_ANNEAL(:,ii), Iq_ANNEAL(:,ii)] = importLA(file_ANNEAL.name);
    
    Iq_ANNEAL(:,ii) = flip(Iq_ANNEAL(:,ii));
    Iq_NA(:,ii) = flip(Iq_NA(:,ii));
    chi_NA(:,ii) = flip(chi_NA(:,ii));
    chi_ANNEAL(:,ii) = flip(chi_ANNEAL(:,ii));
    chi_NA(:,ii) = chi_NA(:,ii).*-1;
    chi_ANNEAL(:,ii) = chi_ANNEAL(:,ii).*-1;
    
    figure(f1)
    plot(chi_NA(:,ii),Iq_NA(:,ii),'LineWidth',1.5)
    hold on
    
    figure(f2)
    plot(chi_ANNEAL(:,ii),Iq_ANNEAL(:,ii),'LineWidth',1.5)
    hold on
    
    figure(f3)
    plot(chi_NA(:,ii),Iq_NA(:,ii).*sind(chi_NA(:,ii)),'LineWidth',1.5)
    hold on
    
    figure(f4)
    plot(chi_ANNEAL(:,ii),Iq_ANNEAL(:,ii).*sind(chi_ANNEAL(:,ii)),'LineWidth',1.5)
    hold on
end

figure(f1)
hold off
title('Layered x1 No Anneal Azimuthal Linecut')
legend('Uncontrolled','25C','75C')
savefig('./processed_imgs/Layered_NA_LA')
print('./processed_imgs/Layered_NA_LA','-dpng','-r300','-f1')

figure(f2)
hold off
title('Layered x1 110C Azimuthal Linecut')
legend('Uncontrolled','25C','75C')
savefig('./processed_imgs/Layered_ANNEAL_LA')
print('./processed_imgs/Layered_ANNEAL_LA','-dpng','-r300','-f2')

figure(f3)
hold off
title('Layered x1 No Anneal Azimuthal Linecut Sin Normalized')
legend('Uncontrolled','25C','75C','Location','southeast')
savefig('./processed_imgs/Layered_NA_LA_sin')
print('./processed_imgs/Layered_NA_LA_sinL','-dpng','-r300','-f3')

figure(f4)
hold off
title('Layered x1 110C Azimuthal Linecut Sin Normalized')
legend('Uncontrolled','25C','75C','Location','southeast')
savefig('./processed_imgs/Layered_ANNEAL_LA_sin')
print('./processed_imgs/Layered_ANNEAL_LA_sin','-dpng','-r300','-f4')

close all
clear all
%%
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