function plot_fano(points,fn)
	if(strcmp(fn,'fano'))
		plot_points(points,'Factor de Fano','varianza','media');
	else
		if(strcmp(fn,'coef'))
			plot_points(points,'Coeficiente de variacion','desvio','media');
		end
	end

end

function plot_points(points,t,x,y)
	%p = max(max(points));
	plot(points(:,1),points(:,2),'x',0.009:0.001:0.011,0.009:0.001:0.011,'linewidth',2);
	title(t,'fontsize',14);
	xlabel(x,'fontsize',12);
	ylabel(y,'fontsize',12);
end
