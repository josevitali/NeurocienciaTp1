function [count1 count2] = classify(data, trainFile)
	trainData = load trainFile;

	upperThreshold = trainData(1);
	lowerThreshold = trainData(2);
	border = trainData(3);
	simetry = trainData(4);

	state = 'searching';
	printf('starting: \n');
	k = 1;
	border = 10;
	for i = 1 : length(data)
		switch (state)
			case 'searching'
				printf('searching\n');
				val = data(i);
				if val > upperThreshold || val < lowerThreshold
					state = 'start window';
					window(k) = val;
				end
			case 'start window'
				printf('starting window');
				k++;
				window(k) = data(i);
				if k == border
					state = 'in window'
					k = 1;
				end
			case 'in window'
				printf('analizing window\n');
				[points indx status] = minMaxComp(values(start,i),threshold);
				if(status)
					if abs(abs(points(1)) - abs(points(2))) < simetry
						printf('dos ojos\n');
					else
						printf('un ojo\n');
					end
				end
					case = 'searching'
		end
	end

end
