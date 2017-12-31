Fs = 1000;  % ����Ƶ��
T = 1/Fs;   % ��������
L = 1000;   % �źų���
t = (0:L-1)*T;  % ʱ������

S = 0.7*sin(2*pi*50*t) + sin(2*pi*120*t);
X = S + 2*randn(size(t));

% ���ٸ���Ҷ�任
Y = fft(X);
P2 = abs(Y);
plot(P2(1:end/2));
