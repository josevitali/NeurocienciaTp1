function vpop = vpop(r,rmax,c)

	vpop = [0,0];
	for i=1:4
		vpop = vpop + (r(i) / rmax(i)) * c(i,:);
	end

end