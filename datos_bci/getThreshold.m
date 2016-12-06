function [upperThreshold lowerThreshold] = getThreshold(values,limits)

	mad = median (abs (values - median(values) ));

	upperThreshold = (mean(values) + 2*std(values))
	lowerThreshold = (mean(values) - 2*std(values))

	%upperThreshold = 0.2*mean(limits(:,1))
	%lowerThreshold = 0.2*mean(limits(:,2))
end