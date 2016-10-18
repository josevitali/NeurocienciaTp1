function ej3()
	load c1p8.mat;
	dt = 300;
	sample_frec = 2;
	mean_stims = mean_stim(rho, stim, dt, sample_frec);
	times = -1 * [0 : sample_frec : dt];
	times = fliplr(times);
	plot(times,mean_stims,'x','linewidth',1);
    title('Media de estimulos','fontsize',14);
    xlabel('tiempo (ms)','fontsize',12);
    ylabel('estimulo','fontsize',12);
    set(gca, 'linewidth', 2, 'fontsize', 12);

end
