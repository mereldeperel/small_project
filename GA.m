function [pop, nofgens] = GA(pop, perc_elite, perc_kill, mutRate, stopcrit, maxgens)
% mutRate [0, 100] which corresponds to the percentage of genes in a geno
% that get mutated
% stopcrit = diff between old fitness and new as precentage of old fitness
% maxgens = max nof generations before STOP
last_gen_fitness = 100;
STOP = false;
nofgens = 1;

while ~STOP
    %% sort

    [~,idx]=sort([pop.fitness]);
    pop=pop(idx);

    %% elite and kill stupids

    % save the perc_elite% best, kill the perc_kill% stupidest
    elite_int = ceil(perc_elite * length(pop))
    kill_int = ceil(perc_kill * length(pop))
    vacancies = length(pop) - elite_int - kill_int

    newpop  = pop(1:elite_int);
    pop = pop(1:end-kill_int);

    %% crossover & mutate

    for aa = 1: vacancies
        mom = pop(ceil(rand * length(pop)));
        dad = pop(ceil(rand * length(pop)));
        childGeno = crossover(mom.geno, dad.geno); % nu kan zelfbevruchting..! randperm?
        
        childGeno = mutate(childGeno, mutRate);
        
        child = Blob(childGeno);
        child.GMX();
        child.FITNESS();    
        newpop = [newpop, child];
    end

    %% add freshies

    % geno size (= nof points) dependent on mean of generation + [-1, 0, 1]
    nofPoints =  floor(mean(length([pop.geno]))/3) + (randperm(3,1)-2);

    for yy = 1:kill_int
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
        newpop = [newpop, aa];
    end

    pop = newpop;
    %% check stop conditions

    gen_fitness = mean([pop.fitness]);
    if (abs(gen_fitness -  last_gen_fitness) / last_gen_fitness <= stopcrit) || nofgens >= maxgens
        STOP = true;
    else
       last_gen_fitness =  gen_fitness;
       nofgens = nofgens + 1;
    end
end

