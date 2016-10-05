function sm = white_noise(m, dt, sigma)
	for i = 1 : m
		sm(i) = normrnd(0 ,sigma/dt);
    end
end


