function find_poiss(neuron)
	means = mean(neuron); 
	vars = var(neuron);
	i = find(means);
	plot(means(i),vars(i),'x');
	title('Factor de Fano','fontsize',14);
	xlabel('media','fontsize',12);
	ylabel('varianza','fontsize',12);
	set(gca, 'linewidth', 3, 'fontsize', 12);


end
