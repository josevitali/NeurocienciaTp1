function r_sample = sample_r(rho)
	acum = 0;
	r_sample = zeros(length(rho)-150,1);
	for i = 151 : length(rho)
		acum = sum(rho(i-150:i));
		r_sample(i-150) = acum/300;
	end

end
