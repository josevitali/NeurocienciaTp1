function c = c_values(means,stim)
	v = [1,0];
	for i=1:4
		m = get_max(means(i,:));
		m = stim(m(2));
		tita = - m;
		R = [cosd(tita),-sind(tita);sind(tita),cosd(tita)];
		c(i,:) = (v * R);
		c(i,:) = c(i,:) / norm(c(i,:));
	end

end