function Periodograma = audio_periodograma(in)
    Periodograma = abs(fft(in)).^2/length(in);
    Periodograma(1) = Periodograma(2);
end