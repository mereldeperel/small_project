function [F] = GMX(env, nofPoints)

    F = zeros(env.xsize +1 ,env.xsize +1);
    for points = 1:nofPoints
        sig = max(abs(randn), 0.3);
        meanx = rand* env.xsize;
        meany = rand* env.ysize;
        for x = 0:env.xsize;
            for y = 0:env.ysize;
                F(floor(x + 1), floor(y + 1)) = F(floor(x + 1), floor(y + 1)) + 1/(sig^2 * 2*pi) .* exp(-((x - meanx).^2 + (y - meany).^2) ./ (2*sig^2));
            end
        end
    end
    
    
%     figure(2)
%     subplot(1,3,1)
%     surf(0:env.xsize, 0:env.ysize, F)
    
    %% thresholding

    thres = 0.05;

    F = min(F, thres);
    
%     subplot(1,3,2)
%     surf(0:env.xsize, 0:env.ysize, F)
    
    F = ceil(F - 0.005);
        
%     subplot(1,3,3)
%     surf(0:env.xsize, 0:env.ysize, F)



