function testbench()
    Amplitud = 1;
    Frec = 1000;
    Fase = 0;
    Offset = 1;
    Muestras = 256;
    Fs = 44100;
    
    senoide = fsenoidal(Amplitud,Frec,Fase,Offset,Muestras,Fs);
    
    Tsenoide = myDFT(senoide);
    
    figure
    subplot(2,1,1);
    plot(senoide);
    ylabel('tension');
    xlabel('tiempo');
    subplot(2,1,2);
    stem(Tsenoide);
    xlabel('muestras');
    ylabel('amplitud');
end