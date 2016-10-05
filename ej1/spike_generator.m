function [X, ws] = spike_generator( lambda, interval )
	lambda_exp = (1.0 * interval) / lambda;
	i = 0;
	t = 0;
	done = 0;
	while(done ~= 1)
		w  = exprnd(lambda_exp);
		if t + w <= interval
			i = i + 1;
	       		t = t + w;
			ws(i) = t;

	 	else
			X = i;
			done = 1;	
        end
    end
end