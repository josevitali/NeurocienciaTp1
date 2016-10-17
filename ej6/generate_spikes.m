function spikes = generate_spikes(r_t, dt)
	spikes = zeros(length(r_t),1);
	for i = 1:length(r_t)
		count = poissrnd(r_t(i)  * dt);
		spikes(i) = count;
	end
end
