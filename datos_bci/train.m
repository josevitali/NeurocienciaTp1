function train(filename,trainFile)
	graphics_toolkit('gnuplot');

	data = load(filename).trainOjos;
	[n m] = size(data);

	for i = 1 : m
		points = getPoints(data{i});
		[maxs mins] = getMinMaxPoints(data{i});
		limits = getSpikeLimits(mins,maxs,data{i});
		[upperThreshold lowerThreshold] = getThreshold(data{i},limits);

		thresholds(i,1) = upperThreshold;
		thresholds(i,2) = lowerThreshold;
		blinkPoints = getUpBlinkPoints(data{i},points,upperThreshold);
%		thresholds(i,3) = getMinMaxDiff(data{i},blinkPoints);
%		thresholds(i,4) = getBlinkVar(data{i},blinkPoints);

		%mins = getDownBlinkPoints(data{i},mins,thresholds(i,1));
		%maxs = getUpBlinkPoints(data{i},maxs,thresholds(i,1));



		limits = filterLimits(limits,upperThreshold,lowerThreshold,data{i});

		subplot(3,1,i);
		N = length(data{i});
		plot([1:N],data{i},'linestyle','-',[1,N],[upperThreshold,upperThreshold],'color','r','linestyle','-',[1,N],[-lowerThreshold,-lowerThreshold],'color','r','linestyle','-',limits(:,1),data{i}(limits(:,1)),'x',limits(:,2),data{i}(limits(:,2)),'x');

	end

	dlmwrite(trainFile,thresholds,',');

end

function minMaxDiff = getMinMaxDiff(values,points)
	values = values ./ max(abs(values));
	minMaxDiff = mean(abs(values(points)) .- abs(values(points+1)));
end

function [upperThreshold lowerThreshold] = getThreshold(values,limits)
	upperThreshold = 0.2*mean(limits(:,1))
	lowerThreshold = 0.2*mean(limits(:,2))
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

function filteredLimits = filterLimits(limits, upperThreshold, lowerThreshold, data)

	maxs = data(limits(:,1))>upperThreshold;
	mins = data(limits(:,2))<-lowerThreshold;
	valid = maxs & mins;
	filteredLimits = limits(valid,:);

end

function [limits] = getSpikeLimits(mins,maxs,data)
	% mins: indices de los minimos
	% maxs: indices de los maximos
	% tomo el primmer maximo.
	% busco el primer minimo con indice mayor que el del maximo
	% busco el ultimo maximo con indice menor que el del minimo

	n = length(mins);
	m = length(maxs);
	j = 1;
	k = 1;
	i = 1;
	while i<=m
			mx = maxs(i);
			mn = mins(j);

			minMin = mn;
			while mn < mx
				j = j+1;
				if j < n
					mn = mins(j);
					if data(mn) < data(minMin)
						minMin = mn;
					end
				else
					return;
				end

			end

			maxMax = mx;
			while i <= m && mx < mn
				i = i+1;
				if i < m
					mx = maxs(i);
					if data(mx) > data(maxMax)
						maxMax = mx;
					end
				end
			end
			limits(k,:) = [maxMax,mn];
			k = k+1;
	end

end
