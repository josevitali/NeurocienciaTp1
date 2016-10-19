function vpop_error()

	load tuning.mat;

				means(1,:) = mean(neuron1(11:end,:));
				means(2,:) = mean(neuron2(11:end,:));
				means(3,:) = mean(neuron3(11:end,:));
				means(4,:) = mean(neuron4(11:end,:));


				r_max(1) = max(means(1,:));
				r_max(2) = max(means(2,:));
				r_max(3) = max(means(3,:));
				r_max(4) = max(means(4,:));

				c = c_values(means,stim);



	for i = 1 : length(stim)
			r = mean([neuron1(1:10,i),neuron2(1:10,i),neuron3(1:10,i),neuron4(1:10,i)]);
			vpoblacional = vpop(r,r_max,c);
			d = vpop_degrees(vpoblacional);
			error_vpop(i) = abs(stim(i)-d);
			vpop_d(i) = d;
	end

		%plot(stim,error_vpop,'x');
		%title('Error del vector poblacional','fontsize',14);
		%xlabel('Estimulo (grados)','fontsize',12);
		%ylabel('Error (grados)','fontsize',12);

		plot(vpop_d,'x','linewidth',2,stim,'-','linewidth',1);
		title('Estimulo real vs Estimulo decodificado','fontsize',14);
		xlabel('Numero de estimulo','fontsize',12);
		ylabel('Valor del estimulo (grados)','fontsize',12);
		legend({'Estimulo decodificado','Estimulo real'},'location','northwest');

end