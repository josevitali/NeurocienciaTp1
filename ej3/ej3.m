function ej3()
	load c1p8.mat;
	dt = 300;
	sample_frec = 2;
	mean_stims = mean_stim(rho, stim, dt, sample_frec);
	times = -1 * [0 : sample_frec : dt];
	times = fliplr(times);
	plot(times,mean_stims,'linewidth',3);
    title('Media de estímulos','fontsize',14);
    xlabel('tiempo (ms)','fontsize',12);
    ylabel('estímulo','fontsize',12);
end
