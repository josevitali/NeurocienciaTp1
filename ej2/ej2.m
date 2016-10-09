function [m  s]  = ej2(n, dt, sigma)
	wn = white_noise(n, dt, sigma);
	white_noise_analizer(wn);
	m = mean(wn);
	s = std(wn);
end
