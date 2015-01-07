function [child] = mutate(child, rate)

global env

%% mutation & make the gene legal again

bin_mute_list = ceil(max(rate-rand(1,length(child)), 0));

SV =  [];     % scale vector
MV = []; % maxvector
MIV = []; % minvector

for aa=1:length(child)/3
	SV =  [SV, env.xsize/10 , env.ysize/10, env.init_sigma/2];	
	MV = [MV, env.xsize, env.ysize, 6*env.init_sigma];
	MIV = [MIV, 0, 0, 0.0001];
end

child = child + bin_mute_list.*randn(1,length(child)).*SV;

child = min(child, MV);
child = max(child, MIV);


