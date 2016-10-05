function recount = spike_recount(ws, interval, dt)
    recount = zeros(ceil(interval / dt), 1);
    for i = ws
        j = ceil(i / dt);
        aux = recount(j);
        recount(j) = aux + 1;
    end
end