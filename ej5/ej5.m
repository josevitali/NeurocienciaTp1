function [pct]  = ej5(experiments, D, neurons)
	stim = zeros(experiments,1);
	responses = zeros(experiments,neurons);
	m = 1;
	for d = D
		for i = 1 : experiments
			stim(i) = rand < 0.5;
			for k = 1 : neurons
				if stim(i)
					responses(i, k) = normrnd(1,10)+20+10*d;
				else
					responses(i , k) = normrnd(0,10)+20;
				end
			end
		end
	
		responses = underZero(responses);
		z = 20 + 5*d;
	
		reconstructed_stim = zeros(experiments,1);
		for i = 1 : experiments
			if mean(responses(i)) > z
				reconstructed_stim(i) = 1;
			end
		end

		res = stim - reconstructed_stim;
		pct(m) = 1 - mean(abs(res));
		m = m + 1;
	end

	plot(D,pct,'linewidth',3);
	title('Frecuencia de aciertos','fontsize',14);
	xlabel('d (discriminabilidad)','fontsize',12);
	ylabel('frecuencia','fontsize',12);
	set(gca, 'linewidth', 2, 'fontsize', 12)

end


