
% sig = 0.1 v 0.2 v 0.5 for a workspace of of 5
SIGS = [0.2 * 20/5, 0.1*4, 0.5*4]; 
MEANX = rand(1,3) .* 20;
MEANY = rand(1,3) .* 20;

F = zeros(101,101);
for points = 1:3
    sig = SIGS(points);
    meanx = MEANX(points);
    meany = MEANY(points);
    for x = 0:0.2:20;
        for y = 0:0.2:20;
            F(floor(x*5 + 1), floor(y*5 + 1)) = F(floor(x*5 + 1), floor(y*5 + 1)) + 1/(sig^2 * 2*pi) .* exp(-((x - meanx).^2 + (y - meany).^2) ./ (2*sig^2));
        end
    end
end


% figure(2)
% surf(0:0.2:20, 0:0.2:20, F)



mu = [1 -1]; 
SIGMA = [.9 .4; .4 .3]; 
X = mvnrnd(mu,SIGMA,10)
