function [count threshold] = blinkCounter(filename)
	data = load(filename);
	if length(data(:,1)) > 1500
		fin = 1500;
	else
		fin = length(data(:,1));
	end

	values = data(1:fin,1);	

	


	[threshold] = getThreshold(values);
	
	plot(values,'-',[1,length(values)],[threshold,threshold])	;

	%peaks1 = values > threshold;
	diffValues = diff(values);
	peaks2 = diffValues < - threshold;

	%count = sum(peaks1(1:end-1)&peaks2);
	count = sum(peaks2);

end

function [threshold] = getThreshold(data)
	
	dataUp = data > 0; #length
	dataDown = data < 0;#length	
	points = find(dataUp(1:end-1) & dataDown(2:end));
	threshold = 2 * abs(mean(diff(data)(points)));
	
end
