function [self] = FITNESS(self)

global env

% volume over boarder relative to own volume
S = 3; % punishment
free = 0.1; % percentage of own volume that is free to trespass

nof_trespass = sum(sum(self.pheno(env.x_loc_boundary:end, :) == 1));
own_vol = sum(sum(self.pheno));
perc_trespass = nof_trespass / own_vol;
P1 = max(perc_trespass - free, 0) * S;

% volume relative to env size
rel_own_vol = own_vol/ (env.xsize * env.ysize);
S = 1; % punishment
free = 0.2; % smallest allowable rel. size

P2 = max(free - rel_own_vol, 0) * S;

S = 1; % punishment
free = 0.8; % largest allowable rel. size

P3 = min(-rel_own_vol + free, 0) * S;

%% add 
self.fitness = P1+P2+P3;