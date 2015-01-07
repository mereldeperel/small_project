function child = crossover(par1, par2)

%% shortest is ma
if length(par1) < length(par2) 
    mom = par1;
    dad = par2;
else
    mom = par2;
    dad = par1;
end

%% determine crossover locations

LL = 1; % LocationList
nof_locs = ceil(rand*(length(mom) / 5));
LL = sort([LL, randperm(length(mom), nof_locs)]);

for aa= 1:nof_locs
    if mod(aa, 2) == 1 
        % odd
        child(LL(aa):LL(aa+1)) = mom(LL(aa):LL(aa+1));
    else
        % even
        child(LL(aa):LL(aa+1)) = dad(LL(aa):LL(aa+1));
    end
end

if mod(nof_locs, 2) == 1
    child = [child, dad(LL(end)+1:end)];
else
    child = [child, mom(LL(end)+1:end)];
end


        
        