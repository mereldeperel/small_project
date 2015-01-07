clc
close all
clear classes

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
global env 


    % size workspace
    env.xsize = 20;
    env.ysize = 20;

    % object = [xmin, xmax, ymin, ymax]
    env.object = [17, 20; 8, 14];

    env.x_loc_boundary = 10;

% GA
    pop_size = 5;
    
    
%  initial population stuff
    nofPoints = 3;
%% init workspace
% plotworkspace(env);

%% Generate blob population

pop = [];

for yy=1:pop_size
    geno = [];
    for points = 1:nofPoints
        sig = max(abs(randn), 0.3);
        meanx = rand* env.xsize;
        meany = rand* env.ysize;
        geno = [geno, meanx, meany, sig]; 
    end
    aa =  Blob(geno);
    aa.GMX();
    aa.FITNESS();
    pop = [pop, aa];
end
    
% plotblobdetect(Blobcollection, 10)
% plotblobdetect(labelarray, 12)
% plotblobdetect(labelarraytemp, 11)
% plotblobdetect(Blob, 14)

%% GA

[pop, nofgens] = GA(pop, perc_elite, perc_kill, mutRate, stopcrit, maxgens)
