function [pct nz] = cmpSpikes(simulated , real)
	count = 0;
	nz_count = 0;
	for i = 1 : length(real)
		if(simulated(i) == real(i))
			count ++;
			if(real(i))
				nz_count ++;
			end
		end

	end
	pct = count / i;
	nz = nz_count / length(find(real));
end
