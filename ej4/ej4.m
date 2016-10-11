function r_est = ej4()
	load c1p8.mat
	r = sum(rho)/(length(rho) * 2);
	s = var(stim)*2;
	means = fliplr(mean_stim(rho,stim,300,2));
	D = (r/s) * means;
	r_est = zeros(length(stim) - 150,1);
	r0 = r;
	D = underZero(D);
	stim = underZero(stim);
	for t = 151 : length(stim)
		stims = fliplr(stim(t - 150 : t ));
		r_est(t - 150) = r0 + D * stims;
	end

	plot(r_est);
end
