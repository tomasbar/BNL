%GIWAXS plot aggregator
%Tomas Barraza

clear all
close all
clc

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

%% Plot SIMULTANEOUS MAPLE circular averages

%Sample identifiers
ID_MAPLE_SIM = ["007","013","008"];

f1 = figure;
f2 = figure;

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
    
    [q_NA(:,ii), Iq_NA(:,ii)] = importCA(file_NA.name);
    [q_ANNEAL(:,ii), Iq_ANNEAL(:,ii)] = importCA(file_ANNEAL.name);
    
    figure(f1)
    plot(q_NA(:,1),Iq_NA(:,ii),'LineWidth',1.5)
    hold on
    
    figure(f2)
    plot(q_ANNEAL(:,1),Iq_ANNEAL(:,ii),'LineWidth',1.5)
    hold on
end

figure(f1)
hold off
title('Simultaneous x2 No Anneal Circular Average')
legend('Uncontrolled','25C','75C')
savefig('./processed_imgs/Simultaneous_NA_CA')
print('./processed_imgs/Simultaneous_NA_CA','-dpng','-r300','-f1')

figure(f2)
hold off
title('Simultaneous x2 110C Circular Average')
legend('Uncontrolled','25C','75C')
savefig('./processed_imgs/Simultaneous_ANNEAL_CA')
print('./processed_imgs/Simultaneous_ANNEAL_CA','-dpng','-r300','-f2')

close all
clear all

%% SEQUENTIAL
ID_MAPLE_SEQ = ["005","011","010"];

f1 = figure;
f2 = figure;

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
    
    [q_NA(:,ii), Iq_NA(:,ii)] = importCA(file_NA.name);
    [q_ANNEAL(:,ii), Iq_ANNEAL(:,ii)] = importCA(file_ANNEAL.name);
    
    figure(f1)
    plot(q_NA(:,1),Iq_NA(:,ii),'LineWidth',1.5)
    hold on
    
    figure(f2)
    plot(q_ANNEAL(:,1),Iq_ANNEAL(:,ii),'LineWidth',1.5)
    hold on
end

figure(f1)
hold off
title('Sequential x1 No Anneal Circular Average')
legend('Uncontrolled','25C','75C')
savefig('./processed_imgs/Sequential_NA_CA')
print('./processed_imgs/Sequential_NA_CA','-dpng','-r300','-f1')

figure(f2)
hold off
title('Sequential x1 110C Circular Average')
legend('Uncontrolled','25C','75C')
savefig('./processed_imgs/Sequential_ANNEAL_CA')
print('./processed_imgs/Sequential_ANNEAL_CA','-dpng','-r300','-f2')

close all
clear all
%% LAYERED
ID_MAPLE_LAY = ["003","014","012"];

f1 = figure;
f2 = figure;

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
    
    [q_NA(:,ii), Iq_NA(:,ii)] = importCA(file_NA.name);
    [q_ANNEAL(:,ii), Iq_ANNEAL(:,ii)] = importCA(file_ANNEAL.name);
    
    figure(f1)
    plot(q_NA(:,1),Iq_NA(:,ii),'LineWidth',1.5)
    hold on
    
    figure(f2)
    plot(q_ANNEAL(:,1),Iq_ANNEAL(:,ii),'LineWidth',1.5)
    hold on
end

figure(f1)
hold off
title('Layered x1 No Anneal Circular Average')
legend('Uncontrolled','25C','75C')
savefig('./processed_imgs/Layered_NA_CA')
print('./processed_imgs/Layered_NA_CA','-dpng','-r300','-f1')

figure(f2)
hold off
title('Layered x1 110C Circular Average')
legend('Uncontrolled','25C','75C')
savefig('./processed_imgs/Layered_ANNEAL_CA')
print('./processed_imgs/Layered_ANNEAL_CA','-dpng','-r300','-f2')

close all
clear all

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

