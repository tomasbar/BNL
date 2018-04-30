%GIWAXS plot aggregator
%Tomas Barraza

clear all
close all
clc

if isfolder('./processed_imgs') == 0
    mkdir('./processed)imgs')
end
%% PLOT MAPLE

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
    
    f1 = figure;
    f2 = figure;
    
    figure(f1)
    montage(filenames_NA,'Size',[2 4],'BackgroundColor','w')
    title(sprintf('MAPLE%c No Anneal',ID_MAPLE(ii)))
    
    figure(f2)
    montage(filenames_ANNEAL,'Size',[2 4],'BackgroundColor','w')
    title(sprintf('MAPLE%c 110%cC Anneal',ID_MAPLE(ii),char(176)))
    
    print(sprintf('./processed_imgs/MAPLE%c_NA.png',ID_MAPLE(ii)),'-dpng','-r200','-f1')
    print(sprintf('./processed_imgs/MAPLE%c_110C.png',ID_MAPLE(ii)),'-dpng','-r200','-f2')
    close all
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

