RGB = imread('../IMAGE/tiananmen.png');
I = rgb2gray(RGB);
figure;
subplot(2,2,1); imshow(I);
% 对灰度图像进行离散余弦变换DCT
J = dct2(I);
subplot(2,2,2); imshow(log(abs(J)), []);

J1 = dct2(I);
J1(abs(J1)<10) = 0;
K1 = idct2(J1);
subplot(2,2,3); imshow(K1, [0,255]);

J2 = dct2(I);
J2(abs(J2)<20) = 0;
K2 = idct2(J2);
subplot(2,2,4); imshow(K2, [0,255]);

