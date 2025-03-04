%GIWAXS plot aggregator
%Tomas Barraza

clear all
close all

%% Set up, clean files

if isfolder('./processed_imgs') == 0
    mkdir('./processed_imgs')
    addpath('./processed_imgs')
end

if isfolder('./old') == 0
    mkdir('./old')
end

% if isfolder('./processed_imgs/horiz') == 0
%     mkdir('./processed_imgs/horiz')
% end
% 
% if isfolder('./processed_imgs/comparisons') == 0
%     mkdir('./processed_imgs/comparisons')
% end

%% Plot MAPLE circular averages

%Sample identifiers
ID_MAPLE = ['2','3','4','5'];

f1 = figure;
f2 = figure;

%Step thru MAPLE samples, by identifier in ID_MAPLE
for ii = 1:length(ID_MAPLE)
    
    %Load sample filenames to be plotted
    file_NA = dir(sprintf('MAPLE%c_NA_th0.220*.dat',ID_MAPLE(ii)));
    file_ANNEAL = dir(sprintf('MAPLE%c_110C_th0.220*.dat',ID_MAPLE(ii)));
    
    if length(file_NA) > 1
        error('TOO MANY DATA POINTS, CHECK FOR DUPLICATES')
        exit
    end
    
    if length(file_ANNEAL) > 1
        error('TOO MANY DATA POINTS, CHECK FOR DUPLICATES')
        exit
    end
    
    [q_NA(:,ii), Iq_NA(:,ii)] = importCA(file_NA(1).name);
    [q_ANNEAL(:,ii), Iq_ANNEAL(:,ii)] = importCA(file_ANNEAL.name);
    
end

figure(f1)
plot(q_NA(:,1),Iq_NA(:,1),'LineWidth',1.5)
hold on
plot(q_ANNEAL(:,1),Iq_ANNEAL(:,1),'LineWidth',1.5)
hold off
title('x1.5 Concentration All Circular Average ')
legend('No Anneal','110C')
savefig('./processed_imgs/highall_CA')
print('./processed_imgs/highall_CA','-dpng','-r300')

figure(f2)
plot(q_NA(:,1),Iq_NA(:,2),'LineWidth',1.5)
hold on
plot(q_ANNEAL(:,1),Iq_ANNEAL(:,2),'LineWidth',1.5)
hold off
title('Baseline Circular Average ')
legend('No Anneal','110C')
savefig('./processed_imgs/baseline_CA')
print('./processed_imgs/baseline_CA','-dpng','-r300')

figure(f1)
plot(q_NA(:,1),Iq_NA(:,3),'LineWidth',1.5)
hold on
plot(q_ANNEAL(:,1),Iq_ANNEAL(:,3),'LineWidth',1.5)
hold off
title('x1.5 Concentration Inorganic Circular Average ')
legend('No Anneal','110C')
savefig('./processed_imgs/highinorganic_CA')
print('./processed_imgs/highinorganic_CA','-dpng','-r300')

figure(f1)
plot(q_NA(:,1),Iq_NA(:,4),'LineWidth',1.5)
hold on
plot(q_ANNEAL(:,1),Iq_ANNEAL(:,4),'LineWidth',1.5)
hold off
title('x1.5 Concentration Organic Circular Average ')
legend('No Anneal','110C')
savefig('./processed_imgs/highorganic_CA')
print('./processed_imgs/highorganic_CA','-dpng','-r300')

% figure(f2)
% hold off
% title('MAPLE 110C Circular Average')
% legend('MAPLE2','MAPLE3','MAPLE4','MAPLE5','MAPLE7')
% savefig('./processed_imgs/MAPLE_ANNEAL_CA')

close all
clear -regexp \d

%% Plot Spincast circular averages

%Sample identifiers
ID_SPIN= ['A','B','C','D'];

f1 = figure;
f2 = figure;
f3 = figure;
f4 = figure;

%Step thru MAPLE samples, by identifier in ID_MAPLE
for ii = 1:length(ID_SPIN)
    
    %Load sample filenames to be plotted
    file_NA = dir(sprintf('SPIN%c_NoMEG_NA_th0.220*.dat',ID_SPIN(ii)));
    file_ANNEAL = dir(sprintf('SPIN%c_NoMEG_110C_th0.220*.dat',ID_SPIN(ii)));
    
    file_MEG_NA = dir(sprintf('SPIN%c_MEG_NA_th0.220*.dat',ID_SPIN(ii)));
    file_MEG_ANNEAL = dir(sprintf('SPIN%c_MEG_110C_th0.220*.dat',ID_SPIN(ii)));
    
    if (length(file_NA) || length(file_ANNEAL) || length(file_MEG_NA) || length(file_MEG_ANNEAL)) > 1
        error('TOO MANY DATA POINTS, CHECK FOR DUPLICATES')
        exit
    end
    
    
    [q_NA(:,ii), Iq_NA(:,ii)] = importCA(file_NA.name);
    [q_ANNEAL(:,ii), Iq_ANNEAL(:,ii)] = importCA(file_ANNEAL.name);
    
    [q_NA_MEG(:,ii), Iq_NA_MEG(:,ii)] = importCA(file_MEG_NA.name);
    [q_ANNEAL_MEG(:,ii), Iq_ANNEAL_MEG(:,ii)] = importCA(file_MEG_ANNEAL.name);
    
    figure(f1)
    plot(q_NA(:,1),Iq_NA(:,ii),'LineWidth',1.5)
    hold on
    figure(f2)
    plot(q_ANNEAL(:,1),Iq_ANNEAL(:,ii),'LineWidth',1.5)
    hold on
    figure(f3)
    plot(q_NA_MEG(:,1),Iq_NA_MEG(:,ii),'LineWidth',1.5)
    hold on
    figure(f4)
    plot(q_ANNEAL_MEG(:,1),Iq_ANNEAL_MEG(:,ii),'LineWidth',1.5)
    hold on
end

figure(f1)
hold off
title('Spincast No Meg No Anneal Circular Average')
legend('Spin A','Spin B','Spin C','Spin D')
savefig('./processed_imgs/Spin_noMEG_NA_CA')

figure(f2)
hold off
title('Spincast No Meg 110C Circular Average')
legend('Spin A','Spin B','Spin C','Spin D')
savefig('./processed_imgs/Spin_noMEG_ANNEAL_CA')

figure(f3)
hold off
title('Spincast Meg No Anneal Circular Average')
legend('Spin A','Spin B','Spin C','Spin D')
savefig('./processed_imgs/Spin_MEG_NA_CA')

figure(f4)
hold off
title('Spincast Meg 110C Circular Average')
legend('Spin A','Spin B','Spin C','Spin D')
savefig('./processed_imgs/Spin_MEG_ANNEAL_CA')

close all
clear -regexp \d

%% PLOT q/qr MAPLE

%Sample identifiers
ID_MAPLE = ['2','3','4','5','7'];

%Step thru MAPLE samples, by identifier in ID_MAPLE
for ii = 1:length(ID_MAPLE)
    
    %Load sample filenames to be plotted
    img_NA = dir(sprintf('MAPLE%c_NA*',ID_MAPLE(ii)));
    img_ANNEAL = dir(sprintf('MAPLE%c_110C*',ID_MAPLE(ii)));
    
    if length(img_NA) > 8
        error('TOO MANY DATA POINTS, CHECK FOR DUPLICATES')
        exit
    end
    
    if length(img_ANNEAL) > 8
        error('TOO MANY DATA POINTS, CHECK FOR DUPLICATES')
        exit
    end
    
    filenames_NA = string({img_NA.name});
    filenames_ANNEAL = string({img_ANNEAL.name});
    
    %Block
    f1 = figure;
    f2 = figure;
    
    figure(f1)
    montage(filenames_NA,'Size',[2 4],'BackgroundColor','w')
    title(sprintf('MAPLE%c No Anneal',ID_MAPLE(ii)))
    
    figure(f2)
    montage(filenames_ANNEAL,'Size',[2 4],'BackgroundColor','w')
    title(sprintf('MAPLE%c 110%cC Anneal',ID_MAPLE(ii),char(176)))
    
    print(sprintf('./processed_imgs/MAPLE%c_NA.png',ID_MAPLE(ii)),'-dpng','-r300','-f1')
    print(sprintf('./processed_imgs/MAPLE%c_110C.png',ID_MAPLE(ii)),'-dpng','-r300','-f2')
    close all
    clear -regexp \d
    
    %Horiz
    f1 = figure;
    f2 = figure;
    
    figure(f1)
    montage(filenames_NA,'Size',[1 8],'BackgroundColor','w')
    title(sprintf('MAPLE%c No Anneal',ID_MAPLE(ii)))
    
    figure(f2)
    montage(filenames_ANNEAL,'Size',[1 8],'BackgroundColor','w')
    title(sprintf('MAPLE%c 110%cC Anneal',ID_MAPLE(ii),char(176)))
   
    
    print(sprintf('./processed_imgs/horiz/MAPLE%c_NA_horiz.png',ID_MAPLE(ii)),'-dpng','-r300','-f1')
    print(sprintf('./processed_imgs/horiz/MAPLE%c_110C_horiz.png',ID_MAPLE(ii)),'-dpng','-r300','-f2')

    
    close all
    clear f*
    
    %Comparison
    f1 = figure;
   
    img_comp = dir(fullfile('./processed_imgs/horiz/',sprintf('MAPLE%c*horiz*',ID_MAPLE(ii))));
    filenames_comp = string({img_comp.name});
    
    figure(f1)
    montage(filenames_comp,'Size',[2 1],'BackgroundColor','w')
        
    print(sprintf('./processed_imgs/comparisons/MAPLE%c_comp.png',ID_MAPLE(ii)),'-dpng','-r300','-f1')
        
    close all
    clear f*
end

%% PLOT q/qr SPINCAST

%Sample identifiers
ID_SPIN= ['A','B','C','D'];

%Step thru MAPLE samples, by identifier in ID_MAPLE
for ii = 1:length(ID_SPIN)
    
    %Load sample filenames to be plotted
    img_MEG_NA = dir(sprintf('SPIN%c_MEG_NA*',ID_SPIN(ii)));
    img_MEG_ANNEAL = dir(sprintf('SPIN%c_MEG_110C*',ID_SPIN(ii)));
    img_noMEG_NA = dir(sprintf('SPIN%c_NoMEG_NA*',ID_SPIN(ii)));
    img_noMEG_ANNEAL = dir(sprintf('SPIN%c_NoMEG_110C*',ID_SPIN(ii)));
    
    if length(img_MEG_NA) > 8
        error('TOO MANY DATA POINTS, CHECK FOR DUPLICATES')
        exit
    end
    
    if length(img_MEG_ANNEAL) > 8
        error('TOO MANY DATA POINTS, CHECK FOR DUPLICATES')
        exit
    end
    
    filenames_MEG_NA = string({img_MEG_NA.name});
    filenames_MEG_ANNEAL = string({img_MEG_ANNEAL.name});
    filenames_noMEG_NA = string({img_noMEG_NA.name});
    filenames_noMEG_ANNEAL = string({img_noMEG_ANNEAL.name});
    
    %Block
    f1 = figure;
    f2 = figure;
    f3 = figure;
    f4 = figure;
    
    figure(f1)
    montage(filenames_MEG_NA,'Size',[2 4],'BackgroundColor','w')
    title(sprintf('SPIN%c MEG No Anneal',ID_SPIN(ii)))
    
    figure(f2)
    montage(filenames_MEG_ANNEAL,'Size',[2 4],'BackgroundColor','w')
    title(sprintf('SPIN%c MEG 110%cC Anneal',ID_SPIN(ii),char(176)))
    
    figure(f3)
    montage(filenames_noMEG_NA,'Size',[2 4],'BackgroundColor','w')
    title(sprintf('SPIN%c No MEG No Anneal',ID_SPIN(ii)))
    
    figure(f4)
    montage(filenames_noMEG_ANNEAL,'Size',[2 4],'BackgroundColor','w')
    title(sprintf('SPIN%c No MEG 110%cC Anneal',ID_SPIN(ii),char(176)))
    
    print(sprintf('./processed_imgs/SPIN%c_MEG_NA.png',ID_SPIN(ii)),'-r300','-dpng','-f1')
    print(sprintf('./processed_imgs/SPIN%c_MEG_110C.png',ID_SPIN(ii)),'-r300','-dpng','-f2')
    print(sprintf('./processed_imgs/SPIN%c_noMEG_NA.png',ID_SPIN(ii)),'-r300','-dpng','-f3')
    print(sprintf('./processed_imgs/SPIN%c_noMEG_110C.png',ID_SPIN(ii)),'-r300','-dpng','-f4')
    
    close all
    clear -regexp \d
    
    %Horiz
    f1 = figure;
    f2 = figure;
    f3 = figure;
    f4 = figure;
    
    figure(f1)
    montage(filenames_MEG_NA,'Size',[1 8],'BackgroundColor','w')
    title(sprintf('SPIN%c MEG No Anneal',ID_SPIN(ii)))
    
    figure(f2)
    montage(filenames_MEG_ANNEAL,'Size',[1 8],'BackgroundColor','w')
    title(sprintf('SPIN%c MEG 110%cC Anneal',ID_SPIN(ii),char(176)))
    
    figure(f3)
    montage(filenames_noMEG_NA,'Size',[1 8],'BackgroundColor','w')
    title(sprintf('SPIN%c No MEG No Anneal',ID_SPIN(ii)))
    
    figure(f4)
    montage(filenames_noMEG_ANNEAL,'Size',[1 8],'BackgroundColor','w')
    title(sprintf('SPIN%c No MEG 110%cC Anneal',ID_SPIN(ii),char(176)))
    
    print(sprintf('./processed_imgs/horiz/SPIN%c_MEG_NA_horiz.png',ID_SPIN(ii)),'-dpng','-r300','-f1')
    print(sprintf('./processed_imgs/horiz/SPIN%c_MEG_110C_horiz.png',ID_SPIN(ii)),'-r300','-dpng','-f2')
    print(sprintf('./processed_imgs/horiz/SPIN%c_noMEG_NA_horiz.png',ID_SPIN(ii)),'-r300','-dpng','-f3')
    print(sprintf('./processed_imgs/horiz/SPIN%c_noMEG_110C_horiz.png',ID_SPIN(ii)),'-r300','-dpng','-f4')
    
    close all
    clear f*
    
    %Comparison
    f1 = figure;
   
    img_comp = dir(fullfile('./processed_imgs/horiz/',sprintf('SPIN%c*horiz*',ID_SPIN(ii))));
    filenames_comp = string({img_comp.name});
    
    figure(f1)
    montage(filenames_comp,'Size',[4 1],'BackgroundColor','w')
        
    print(sprintf('./processed_imgs/comparisons/SPIN%c_comp.png',ID_SPIN(ii)),'-r300','-dpng','-f1')
        
    close all
    clear f*
end

%% OLD
% % Use for loops to read into 4D arrays

% %Read images from given sample into 4D RGB arrays
% for i = 1:length(img_NA)
%     MAPLE_NA(:,:,:,i) = imread(img_NA(i).name);
% end
% 
% for i = 1:length(img_ANNEAL)
%     MAPLE_ANNEAL(:,:,:,i) = imread(img_ANNEAL(i).name);
% end

% %Manually read images into RGB arrays
% img_NA_009 = imread(MAPLE_NA(1).name,'png','BackgroundColor','none');
% img_NA_011 = imread(MAPLE_NA(2).name,'png','BackgroundColor','none');
% img_NA_013 = imread(MAPLE_NA(3).name,'png','BackgroundColor','none');
% img_NA_015 = imread(MAPLE_NA(4).name,'png','BackgroundColor','none');
% img_NA_018 = imread(MAPLE_NA(5).name,'png','BackgroundColor','none');
% img_NA_020 = imread(MAPLE_NA(6).name,'png','BackgroundColor','none');
% img_NA_022 = imread(MAPLE_NA(7).name,'png','BackgroundColor','none');
% img_NA_025 = imread(MAPLE_NA(8).name,'png','BackgroundColor','none');
% 
% img_ANNEAL_009 = imread(MAPLE_ANNEAL(1).name,'png','BackgroundColor','none');
% img_ANNEAL_011 = imread(MAPLE_ANNEAL(2).name,'png','BackgroundColor','none');
% img_ANNEAL_013 = imread(MAPLE_ANNEAL(3).name,'png','BackgroundColor','none');
% img_ANNEAL_015 = imread(MAPLE_ANNEAL(4).name,'png','BackgroundColor','none');
% img_ANNEAL_018 = imread(MAPLE_ANNEAL(5).name,'png','BackgroundColor','none');
% img_ANNEAL_020 = imread(MAPLE_ANNEAL(6).name,'png','BackgroundColor','none');
% img_ANNEAL_022 = imread(MAPLE_ANNEAL(7).name,'png','BackgroundColor','none');
% img_ANNEAL_025 = imread(MAPLE_ANNEAL(8).name,'png','BackgroundColor','none');

