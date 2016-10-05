function intervals = get_intervals(xs, p)
	if length(xs) <= p
		return 
    end
	intervals = zeros(1 ,length(xs) - p);
	for i = p + 1 : length(xs)
		intervals(i-p) = xs(i) - xs(i-p);
    end
end
