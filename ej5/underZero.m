function X = underZero(X)
	for j = 1 : length(X(1,:))
		for i = 1 : length(X(:,1))
			if(X(i,j) < 0)
				X(i,j)=0;
			end
		end
	end
end
