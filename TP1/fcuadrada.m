function y = fcuadrada(A,tau,phase,offset,N,fs)
    i=1:N;
    sal = offset + A*square(2*pi*tau*i/fs + phase);
    y = sal;
end