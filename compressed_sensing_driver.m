function compressed_sensing_driver
    % Load in audio file
    [data, rate] = audioread("440_sine.wav", [10001, 30000]);
    data = sparse(data);
    
    % Consider only the first channel
    data0 = data(:, 1);
    data0_size = size(data0);
    length = data0_size(1);
    
    % Compute Haar wavelet matrix of this size
    W = WaveletMatrix(length, 'haar');
    
    % Obtain wavelet representation of audio
    y = mtimes(W, data0);
    
    % Find LASSO sparse representation of initial vector
    x = compress(W, y);
    
    % Write vector to file
    audiowrite('lasso_compressed.wav', x, rate);
    
    % Plot to show the difference
    xs = linspace(1, length, length);
    hold on
    plot(xs, data0);
    plot(xs, x);
    hold off
end