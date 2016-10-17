function ej6b()
	load tuning.mat;
	dt = 1;
	spikes = zeros(4,24);
	spikes(1,:) = generate_spikes(mean(neuron1),dt);
	spikes(2,:) = generate_spikes(mean(neuron2),dt);
	spikes(3,:) = generate_spikes(mean(neuron3),dt);
	spikes(4,:) = generate_spikes(mean(neuron4),dt);

	
	spikes
	
	for i = 1 : length(spikes(:,1))
		fano_fact(i) = var(spikes(i,:)) / mean(spikes(i,:));
	end	

	fano_fact
end
