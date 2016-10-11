function max = get_max(x)
    max = zeros(1,2);
    dim = size(x);
    length = dim(2);
    for i = 1 : length
        if(x(i) > max)
            max(1) = x(i);
            max(2) = i;
        end
    end
end