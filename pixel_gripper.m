clc
close all

format compact

%% BLOBS 

% materials 1-5
%     not so elastic
%         1 channel horizontal
%         2 channel horizontal AND vertical
%         3 channel vertical
%         4 NO channel
%     very elastic
%         5 chamber 

%% CONFIG

% ENVIRONMENT
    % size workspace
    env.xsize = 20;
    env.ysize = 20;

    % object = [xmin, xmax, ymin, ymax]
    env.object = [17, 20; 8, 14];

    env.x_loc_boundary = 10;

% GA
    pop_size = 5;
    
%% init workspace
% plotworkspace(env);

%% Generate blob
Blobcollection = GMX(env, 7);

[labelarray, labellist, labelarraytemp, sizelist, Blob] = detectblob(Blobcollection);

plotblobdetect(Blobcollection, 10)
% plotblobdetect(labelarray, 12)
% plotblobdetect(labelarraytemp, 11)
plotblobdetect(Blob, 14)



