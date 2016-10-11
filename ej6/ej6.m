function ej6()
	load tuning.mat;
	mean1 = means(neuron1);
	mean2 = means(neuron2);
	mean3 = means(neuron3);
	mean4 = means(neuron4);

	plot(stim,mean1, 'linewidth',2 ,stim,mean2 ,'linewidth',2,stim,mean3,'linewidth',2,stim,mean4,'linewidth',2);
	legend({'neuron1','neuron2','neuron3','neuron4'});
	xlabel('direccion del viento (grados)','fontsize',12);
	ylabel('tasa de disparo media (Hz)','fontsize',12);
	title('Curva de ajuste','fontsize',14);
	set(gca, 'linewidth', 3, 'fontsize', 12);
	copied_legend = findobj(gcf(),"type","axes","Tag","legend");
	set(copied_legend, "FontSize", 12);
	print('curva_de_ajuste.jpg');

end
