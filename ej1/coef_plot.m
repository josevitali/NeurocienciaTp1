function points = coef_plot(n)
	points = zeros(n,2);
	for i = 1 : n 
		[a,b,c,pts] = ej1();
		points(i,:) = pts;
	end

end
