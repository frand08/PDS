function X = myDFT(x)
    N = length(x);
    suma = zeros(N,1);
    n = 1:N;
    w = exp(-2*pi*1i/N);
    wx(n,1) = w.^n;
    x = x';
    for k=1:N
        suma(k,1) = x'*(wx.^(k-1));
    end
    suma = suma/N;
    suma = suma(1:(round(N/2)+1))';
    X = suma;
end