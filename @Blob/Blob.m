classdef (ConstructOnLoad) Blob <handle 
    % <handle because otherwise self = GMX(self) would not work. something
    % with pointer to self so within GMX self can be altered. (its not a
    % copy of self)
   properties
      fitness % scalar
      pheno % matrix of env size
      geno % vecotr with tipple [x,y, sigma] for every gaussian point
   end
   
   methods
        function b = Blob(gen)
            % contructor
            if(nargin > 0)
                b.geno = gen;
            else
                b.geno = [1, 1, 1];
            end
        end
        self = GMX(self);
        self = FITNESS(self); 
   end 
   methods (Static=true) % non-static send self as first arg. detectblob is called from another method so cant be non-static
        pheno = detectblob(phenospace);
   end
    
end % classdef
