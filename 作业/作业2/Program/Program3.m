load imdemos saturn2;
Image = saturn2;


% 巴特沃斯高通滤波
D0 = 50;
ButterworthHighPassFilter(Image, D0);

D0 = 10;
ButterworthHighPassFilter(Image, D0);
