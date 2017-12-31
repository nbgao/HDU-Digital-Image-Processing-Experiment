Fs = 1000;  % 采样频率
T = 1/Fs;   % 采样周期
L = 1000;   % 信号长度
t = (0:L-1)*T;  % 时间向量

S = 0.7*sin(2*pi*50*t) + sin(2*pi*120*t);
X = S + 2*randn(size(t));

% 快速傅立叶变换
Y = fft(X);
P2 = abs(Y);
plot(P2(1:end/2));
