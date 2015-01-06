function[] = plotworkspace(env)

% object = [xmin, xmax, ymin, ymax]

    figure(1)
    pixarray = zeros(env.xsize, env.ysize);
    
    obj_y = [env.object(1), env.object(1), env.object(2), env.object(2)];
    obj_x = [env.object(4), env.object(3), env.object(3), env.object(4)];
    fill(obj_x, obj_y, 'r' );
    hold on;
    
    [aa, bb] = size(pixarray);
    
    line([0,0], [0, bb])
    line([0,aa], [0,0])
    line([aa, aa], [0, bb])
    line([0,aa], [bb, bb])
    
    line([env.x_loc_boundary, env.x_loc_boundary],[0, bb], 'color', 'm')

