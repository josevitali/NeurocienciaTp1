function wn = uniform_white_noise(n, var, dt)

    var = var/dt;

    b1 = (-4 + sqrt(16+192*var)) / 8;
    
    b2 = (-4 - sqrt(16+192*var)) / 8;

    b = b1;
    a = -b1;
    
    r = rand(n,1);
    
    wn(:,1) = a + (b - a) * r;

    b = b2;
    a = -b2;
    
    wn(:,2) = a + (b - a) * r;
    
end