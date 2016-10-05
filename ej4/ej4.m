function r_est = ej4()
	load c1p8.mat
	r = sum(rho)/(length(rho) * 2);
	s = var(stim)*2;
	means = fliplr(mean_stim(rho,stim,300,2));
	D = (r/s) * means;
	r_est = zeros(length(stim) - 150,1);
	r0 = r;
	for t = 151 : length(stim)
		stims = fliplr(stim(t - 150 : t ));
		r_est(t) = r0 + D * stims;
	end

	%graphics_toolkit gnuplot
	%f =  figure('visible','off');
	plot(r_est);
end
