function windowLength = getWindowLength(indexes)

	maxs = indexes(:,1);
	mins = indexes(:,2);


	windowLength = ceil(2 * mean(indexes(:,2) - indexes(:,1)));

end