load imdemos saturn2;
Image = saturn2;


% ������˹��ͨ�˲�
D0 = 50;
ButterworthHighPassFilter(Image, D0);

D0 = 10;
ButterworthHighPassFilter(Image, D0);
