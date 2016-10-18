function [r_est D] = ej4()
	load c1p8.mat
	r = sum(rho)/(length(rho) * 2);
	s = var(stim);
	C = mean_stim(rho,stim,300,2);
	D = (r/s) * C;
	r_est = zeros(length(stim) - 150,1);
	stim = stim .- mean(stim);
	r0 = 0;
	D = underZero(D);
	for t = 1 : length(stim) - 150
		stims = stim(t:t+150);
		r_est(t) = r0 + D * stims;
	end
	
end
