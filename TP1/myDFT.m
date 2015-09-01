function [X] = myDFT(x)
    N = length(x);
    suma = zeros(N,1);
    wx = zeros(N,1);
    aux = zeros(N,1);
    n = 1:N;
    w = exp(-2*pi*i/N);
    wx(n,1) = w.^n;
    x = x';
    n = n';
    for k=1:N
        suma(k,1) = x*(wx.^(k-1));
    end
    suma = suma/N;
    suma = suma';
    X = abs(suma(1:N/2));
end