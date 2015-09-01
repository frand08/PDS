    Amplitud = 1;
    Fase = 0;
    Offset = 0;
    N = 8;
    Fs = 1;
    Deltaf=Fs/N;
    fon=N/2;
    Frec = fon*Deltaf;

y = fsenoidal(Amplitud,Frec,Fase,Offset,N,Fs);

x = myDFT(y);

subplot(211);
plot(y);
subplot(212);
plot(x);

