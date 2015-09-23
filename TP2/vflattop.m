function v_flattop = vflattop(N)
    a0 = 0.21557895;
    a1 = 0.41663158;
    a2 = 0.277263158;
    a3 = 0.083578947;
    a4 = 0.006947368;
    
    n = 0:N-1;
    w = a0 - a1*cos(2*pi*n/(N-1)) + a2*cos(4*pi*n/(N-1)) - a3*cos(6*pi*n/(N-1)) + a4*cos(8*pi*n/(N-1));
    v_flattop = w';
end