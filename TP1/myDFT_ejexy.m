function [X f] = myDFT_ejexy(x,fs)
    X=myDFT(x);
    N=length(x);
    f=0:(fs/N):(fs/2);
end