function [meanSimetry stdSimetry] = getSimetry(spikes)

	maxSpike = max(max(abs(spikes)));

	spikes = spikes ./ maxSpike;

	simetry = abs(abs(spikes(:,2)) - abs(spikes(:,1)));

	meanSimetry = mean(simetry);
	stdSimetry = std(simetry);

end