from scipy.io.wavfile import read
import numpy as np
import pywt

# Stereo audio; take only the first channel.
rate, data = read("440_sine.wav")
data0 = data[:, 0]

# For wavelet transform, let the input data stream be even.
# Get rid of the first element if the amount of data is odd.
if len(data0) % 2 == 1:
    data0 = data0[1:]

# Compute Continuous Wavelet Transform.
scale = 2
coeff, freqs = pywt.cwt(data0, np.arange(1, 129), 'gaus1')

print(rate)
print(coeff.shape)
print(freqs.shape)

