function plot_ajuste(neuron,stim)
	neuron_mean = mean(neuron);
	neuron_max = get_max(neuron_mean);
	neuron_aprox = aprox_cos(0:360,neuron_mean,neuron_max(1),stim(neuron_max(2)));
	plot(stim,neuron_mean,'x','linewidth',2,0:360,neuron_aprox);
	title('Curva de Ajuste');
	xlabel('stim (grados)');
	ylabel('tasa de disparo media (Hz)');
	set(gca, 'linewidth', 3, 'fontsize', 12);
	axis([0,360]);
end
