function [var_coef,fano_fact] = ej1()
    [X, ws] = spike_generator(1000, 10);
    intervals = get_intervals(ws, 1);
    var_coef = std(intervals) / mean(intervals);
    fano_fact = zeros(100,1);
    for i = [1:100]
        dt = i * 1.0 / 1000;
        recount = spike_recount(ws, 10, dt);
        fano_fact(i) = var(recount) / mean(recount);
    end
    fano_fact;
    hist(intervals);
    title('Histograma de longitud de intervalos entre disparos','fontsize',14);
    xlabel('tiempo (s)','fontsize',12);
end
