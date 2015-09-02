function y = fsenoidal(A,fo,phase,offset,N,fs)
% A: amplitud (input)
% fo: frecuencia de la onda (input)
% phase: desfazaje (input)
% offset: nivel de continua (input)
% N: numero de muestras (input)
% fs: frecuencia de muestreo (input)
% y: senoidal (output)
    n=0:N-1;
    t = n/fs;
    sal = offset + A*sin(2*pi*fo*t + phase);
    y = sal';
end