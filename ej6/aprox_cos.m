function y = aprox_cos(stim, x, rmax, p)

    y = zeros(1, length(stim));
    for i = 1 : length(stim)
        cos_result = cosd(stim(i) - p);
        if(cos_result < 0)
            cos_result = 0;
        end
        y(i) = cos_result * rmax;        
    end
end
