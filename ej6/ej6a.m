function ej6a()
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
	print('curva_de_ajuste.png');


	max1 = get_max(mean1);
	max2 = get_max(mean2);
	max3 = get_max(mean3);
	max4 = get_max(mean4);
	

	aprox1 = aprox_cos(stim,mean1,max1(1),max1(2));
	aprox2 = aprox_cos(stim,mean2,max2(1),max2(2));
	aprox3 = aprox_cos(stim,mean3,max3(1),max3(2));
	aprox4 = aprox_cos(stim,mean4,max4(1),max4(2));

	
	plot(stim,aprox1, 'linewidth',2 ,stim,aprox2 ,'linewidth',2,stim,aprox3,'linewidth',2,stim,aprox4,'linewidth',2);
	legend({'neuron1','neuron2','neuron3','neuron4'});
	xlabel('direccion del viento (grados)','fontsize',12);
	ylabel('tasa de disparo media (Hz)','fontsize',12);
	title('Curva de ajuste aproximada','fontsize',14);
	set(gca, 'linewidth', 3, 'fontsize', 12);
	copied_legend = findobj(gcf(),"type","axes","Tag","legend");
	set(copied_legend, "FontSize", 12);
	print('curva_de_ajuste_aprox.png');


end
