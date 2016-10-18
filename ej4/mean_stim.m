function mean_stimuli = mean_stim(rho, stim, dt, sample_frec)
	i = dt/sample_frec + 1;
	p = 1;
	n = sum(rho(i:end));
	stimuli = zeros(n,i);

	while i <= length(rho)
		if rho(i) == 1
			j = i - dt/sample_frec;
			stimuli(p,:) = stim(j:i);
			p = p + 1;
		end
		i = i + 1;
	end

	mean_stimuli = mean(stimuli);
end
