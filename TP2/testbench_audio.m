function testbench_audio
    [in,fs] = audioread('G_3_8k.wav');
    in=in(:,1);
    R=100;
    periodograma=audio_periodograma(in);
    barlett=audio_barlett(in,R);
    
    subplot(211);
    stem(periodograma);title('Periodograma');
    subplot(212);
    stem(barlett);title('Barlett');
    
end
