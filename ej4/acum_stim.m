function acum_stim = acum_stim(stim)
	acum_stim = zeros(length(stim),1);
	acum = 0;
	for i = 1 : length(stim)
		acum += stim(i);
		acum_stim(i) = acum;
	end
end
