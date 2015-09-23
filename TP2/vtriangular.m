function v_triang = vtriangular(N)
    i=1:N;    
    paridad = mod(N,2);
    w = [];
    if paridad == 1
        n = 1:((N+1)/2);
        w = 2*n/(N+1);
        n=((N+1)/2+1):N;
        w = [w 2-2*n/(N+1)];
    else
        n = 1:(N/2);
        w = (2*n-1)/N;
        n=(N/2+1):N;
        w = [w 2-(2*n-1)/N];
    end
        
    v_triang = w';
end