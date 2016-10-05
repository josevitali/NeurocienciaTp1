function autcor = autocorrelation(wn,p) 
	M = length(wn);
	smp = wn(1+p:end);
	sm = wn(1:end-p);
	autcor = (1/M) * sum(sm .* smp);
end
