function [ rmax ] = get_rmax( datos )
    rmax = max(max(mean(datos)));
end

