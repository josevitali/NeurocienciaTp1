function train(filename,trainFile)
	%graphics_toolkit('gnuplot');

	data = load(filename).trainOjos;
	[n m] = size(data);

	for i = 1 : m
		[spikes indexes status] = minMaxComp(data{i});

		windowLength = getWindowLength(indexes);

		[meanSimetry stdSimetry] = getSimetry(spikes);

		maxs = spikes(:,1);
		mins = spikes(:,2);
		[upperThreshold lowerThreshold] = getThreshold(data{i});

		thresholds(i,1) = upperThreshold;
		thresholds(i,2) = lowerThreshold;
		thresholds(i,3) = windowLength;
		simetry(i,1) = meanSimetry;
		simetry(i,2) ) stdSimetry;

		subplot(3,1,i);
		N = length(data{i});
		plot([1:N],data{i},'linestyle','-',[1,N],[upperThreshold,upperThreshold],'color','r','linestyle','-',[1,N],[lowerThreshold,lowerThreshold],'color','r','linestyle','-',maxs,data{i}(maxs),'x',mins,data{i}(mins),'x');

	end

	trainData(1) = min(thresholds(:,1));
	trainData(2) = min(thresholds(:,2));
	trainData(3) = max(thresholds(:,3));

	dlmwrite(trainFile,trainData,',', simetry, ',');

end

function minMaxDiff = getMinMaxDiff(values,points)
	values = values ./ max(abs(values));
	minMaxDiff = mean(abs(values(points)) .- abs(values(points+1)));
end



function [points] = getPoints(values)
	values = diff(values);
	valuesUp = values > 0; #length
	valuesDown = values < 0;#length
	points = find(valuesUp(1:end-1) & valuesDown(2:end));

end

function blinkVar = getBlinkVar(values,points)
	blinkVar = std(values(points));
end

function blinkPoints = getUpBlinkPoints(values,points,threshold)
	indx = find(values(points) > threshold);
	blinkPoints = points(indx);
end

function blinkPoints = getDownBlinkPoints(values,points,threshold)
	indx = find(values(points) < -threshold);
	blinkPoints = points(indx);
end

