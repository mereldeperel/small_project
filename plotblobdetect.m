function [] = plotblobdetect(blobspace, fignum)

[m, n] = size(blobspace); % y, x

figure(fignum)
hold on

for a = 1:m
    for b = 1:n
        Q = mod(blobspace(a,b), 6);
        if Q == 1
            plot(a, b, '*r')
        elseif Q == 2
            plot(a, b, '*b')
        elseif Q == 3
            plot(a, b, '*g')
        elseif Q == 4
            plot(a, b, '*m')
        elseif Q == 5
            plot(a, b, '*y')
        elseif Q == 0 && blobspace(a,b) ~= 0
            plot(a, b, '*c')
        elseif blobspace(a,b) == 0
            plot(a, b, '*w')            
        end
    end
end

            