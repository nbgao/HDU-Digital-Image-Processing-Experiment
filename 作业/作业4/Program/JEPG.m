clear;
close all;

path1 = '../IMAGE/lena.png';
I0 = imread(path1);
factor = [20, 60, 80];

figure;
subplot(2,2,1); imshow(I0); title('原始图像');

[I1, K1] = jpeg(20);
subplot(2,2,2); imshow(I1); title(['质量因子=', num2str(20)]);

[I2, K2] = jpeg(60);
subplot(2,2,3); imshow(I2); title(['质量因子=', num2str(60)]);

[I3, K3] = jpeg(80);
subplot(2,2,4); imshow(I3); title(['质量因子=', num2str(80)]);
