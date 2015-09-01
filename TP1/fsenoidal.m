function y = fsenoidal(A,fo,phase,offset,N,fs)
    i=1:N;
    t = i/fs;
    sal = offset + A*sin(2*pi*fo*t + phase);
    y = sal';
end