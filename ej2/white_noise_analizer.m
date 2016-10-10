function white_noise_analizer(wn)
	n = length(wn);
	m = n / 5; % cambiar
	autcor = zeros(1, 2*m + 1);
	for p = 1 : m
		a =  autocorrelation(wn,p + (m-1));
		autcor(p) = a;
		autcor(2*m + 2 - p) = a;
	end
	autcor(m + 1) = autocorrelation(wn,0);
	
	l = (length(autcor) - 1) / 2;
	x = [-l:l];
	stem(x,autcor,'linewidth',2,'markersize',7,'filled');
	title('Autocorrelación de un estímulo de ruido blanco','fontsize',14);
	xlabel('lag','fontsize',12);
end
