function train(filename,trainFile)

	data = load(filename).trainOjos;
	[n m] = size(data);
	
	for i = 1 : m
		points = getPoints(data{i});
		thresholds(i,1) = getThreshold(data{i},points);
		blinkPoints = getBlinkPoints(data{i},points,thresholds(i,1));
		thresholds(i,2) = getMinMaxDiff(data{i},blinkPoints);
		thresholds(i,3) = getBlinkVar(data{i},blinkPoints);
	
		subplot(3,1,i);
		plot(data{i},'-',[1,length(data{i})],[thresholds(i,1),thresholds(i,1)],'r',blinkPoints,data{i}(blinkPoints),'x');
		
	end

	dlmwrite(trainFile,thresholds,',');

end

function minMaxDiff = getMinMaxDiff(values,points)
	values = values ./ max(abs(values));
	minMaxDiff = mean(abs(values(points)) .- abs(values(points+1)));	
end

function [threshold] = getThreshold(values,points)
	threshold = 2 * abs(mean(diff(values)(points)));	
end

function [points] = getPoints(values)
	valuesUp = values > 0; #length
	valuesDown = values < 0;#length	
	points = find(valuesUp(1:end-1) & valuesDown(2:end));

end

function blinkVar = getBlinkVar(values,points)
	blinkVar = std(values(points));
end

function blinkPoints = getBlinkPoints(values,points,threshold)
	indx = find(values(points) > threshold);
	blinkPoints = points(indx);
end

