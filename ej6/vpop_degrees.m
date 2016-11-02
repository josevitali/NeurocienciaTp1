function degrees = vpop_degrees(vpop)
	degrees = atan2d(vpop(2),vpop(1));
	if degrees < 0
		degrees = degrees + 360;
	end

end