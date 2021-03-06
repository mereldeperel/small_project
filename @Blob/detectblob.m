function [Blob] = detectblob(blobspace)

[m, n] = size(blobspace);
labelarray = zeros(m, n);
curr_label = 0;
equiv = [];

%% init left line with labels

for w = 1:n 
    if  blobspace(1,w) == 1 
        if w ~= 1
            if blobspace(1,w-1) == 1 
                labelarray(1,w) = labelarray(1, w-1);
            else
                curr_label = curr_label +1;
                labelarray(1,w) = curr_label;
            end
        else
            curr_label = curr_label +1;
            labelarray(1,w) = curr_label;   
        end
    else
        labelarray(1,w) = 0;
    end
end

%% init bottom line with labels

for w = 1:m
    if  blobspace(w,1) == 1 
        if w ~= 1
            if blobspace(w-1,1) == 1 
                labelarray(w,1) = labelarray(w-1,1);
            else
                curr_label = curr_label +1;
                labelarray(w,1) = curr_label;
            end
        else
            curr_label = curr_label +1;
            labelarray(w,1) = curr_label;   
        end
    else
        labelarray(w,1) = 0;
    end
end

%% left to right, bottom to top     
for a = 2:n
    for b =2:m
        if blobspace(b,a) == 1
            if blobspace(b,a-1) == 1 % south
                labelarray(b,a) = labelarray(b,a-1);
                if blobspace(b-1,a) == 1 && labelarray(b,a-1) ~= labelarray(b-1,a) % south & west same but diff labels
                    equiv = [equiv ; [labelarray(b-1,a), labelarray(b,a-1)]];
                    %labelarray(b-1,a) = labelarray(b,a-1);
                end
            elseif blobspace(b-1,a) == 1
                labelarray(b,a) = labelarray(b-1,a);
            else
                curr_label = curr_label + 1;
                labelarray(b,a) = curr_label;
            end
        else
           labelarray(b,a) = 0;
        end
    end
end

labelarraytemp = labelarray;

if ~isempty(equiv)
    for ee = 1:size(equiv, 1)
        maxlab = max(equiv(ee,:));
        minlab = min(equiv(ee,:));
        if minlab ~= 0
            % blob map
            change_indices = find(labelarray == maxlab);
            if change_indices ~= 0 
                for bb = 1:length(change_indices)
                    labelarray(change_indices(bb)) = minlab;
                end
            end
            % equiv array itself
            change_indices = find(equiv(1:size(equiv, 1), :) == maxlab);
            if change_indices ~= 0 
                for bb = 1:length(change_indices)
                    equiv(change_indices(bb)) = minlab;
                end
            end
        end    
    end
end

labellist = [];
sizelist = [];
for dd = 1:curr_label
    occurance = length(find(labelarray == dd));
    if occurance ~= 0 
        labellist = [labellist, dd];
        sizelist = [sizelist, occurance];
    end
end

[u,v]= max(sizelist);

if ~isempty(v)
    Blob = (labelarray == v);
else
    Blob = labelarray;
end



                    
                    
                
                
                
                
            
                
    
        