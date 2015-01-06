funtion [fitness] = FITNESS(pheno)

nof_trespass = sum(pheno(env.x_loc_boundary:end, :) == 1);
fitness = nof_trespass;