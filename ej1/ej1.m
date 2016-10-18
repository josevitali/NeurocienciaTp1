function [var_coef,fano_fact,fano_points,var_coef_points] = ej1()
    [X, ws] = spike_generator(1000, 10);
    intervals = get_intervals(ws, 1);
    var_coef = std(intervals) / mean(intervals);
    fano_fact = zeros(100,1);
    fano_points = zeros(100,2);
    for i = [1:100]
        dt = i * 1.0 / 1000;
        recount = spike_recount(ws, 10, dt);
	fano_points(i,1) = var(recount);
	fano_points(i,2) = mean(recount);
        fano_fact(i) = fano_points(i,1) / fano_points(i,2);
    end

	var_coef_points(1) = std(intervals);
	var_coef_points(2) = mean(intervals);
    fano_fact;
    
    %hist(intervals);
    %title('Histograma de longitud de intervalos entre disparos','fontsize',14);
    %xlabel('tiempo (s)','fontsize',12);
    


end
