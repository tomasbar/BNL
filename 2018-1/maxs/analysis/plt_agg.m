%GIWAXS plot aggregator
%Tomas Barraza

clear all
clc
%% PLOT MAPLE
%Load sample filenames to be plotted

%Sample identifiers
ID_MAPLE = ['2','3','4','5','7'];

for ii = 1:length(ID_MAPLE)
    
    img_NA = dir('MAPLE2_NA*');
    img_ANNEAL = dir('MAPLE2_110C*');
    
    %Read images into 4D RGB arrays
    for i = 1:length(img_NA)
        MAPLE_NA(:,:,:,i) = imread(img_NA(i).name);
    end
    
    for i = 1:length(img_ANNEAL)
        MAPLE_ANNEAL(:,:,:,i) = imread(img_ANNEAL(i).name);
    end
    
end
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

