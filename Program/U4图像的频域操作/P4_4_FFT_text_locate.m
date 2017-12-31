% 读入图像
bw = rgb2gray(imread('../IMAGE/text.jpg'));
figure;
subplot(2,2,1); imshow(bw);

% 将待识别目标从图像中切割出来
a = bw(37:115, 20:98);
subplot(2,2,2); imshow(a);


% 将字母a和待识别图像进行快速傅立叶变换并计算卷积
a(256,256) = 0;
C = real(ifft2(fft2(bw) .* fft2(rot90(a,2),256,256)));
C = 256 * (C-min(min(C)))/(max(max(C))-min(min(C)));
subplot(2,2,3); imshow(C,[]);

% 选取阈值进行目标定位
thresh = 160;
subplot(2,2,4); imshow(C>thresh);

