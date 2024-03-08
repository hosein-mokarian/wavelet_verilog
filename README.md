## Discrete Wavelet Transform (DWT)
A discrete wavelet transform (DWT) is a transform that decomposes a given signal into a number of sets, where each set is a time series of coefficients describing the time evolution of the signal in the corresponding frequency band.
It is one of the major algorithms in signal processing. One of its application is signal denoising. It can be used as a front-end stage to remove disturbance of a signal.
There are lots of wavelets types. Everyone can be used foe a special signal. There is one simple rule to select appropriate wavelet and that is how much the wavelet is similar to the input signal. 
Here we are going to implement symlet4 on FPGA. We want to denoise an ECG signal. The HDL language which is selected is Verilog.
