load imdemos saturn2;
Image = saturn2;

% ������˹��ͨ�˲�
D0 = 50;
ButterworthLowPassFilter(Image, D0);

D0 = 30;
ButterworthLowPassFilter(Image, D0);