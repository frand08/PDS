function y = fsenoidal(A,fo,phase,offset,N,fs)
    n=0:N-1;
    t = n/fs;
    sal = offset + A*sin(2*pi*fo*t + phase);
    y = sal';
end