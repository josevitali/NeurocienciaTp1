function ej3()
	load c1p8.mat;
	dt = 300;
	sample_frec = 2;
	mean_stims = mean_stim(rho, stim, dt, sample_frec);
	times = -1 * [0 : sample_frec : dt];
	times = fliplr(times);
	plot(times,mean_stims);
    title('media de estímulos (0:300) ms');
    xlabel('tiempo (ms)');
    ylabel('estímulo');
end
