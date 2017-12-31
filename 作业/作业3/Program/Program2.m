figure;
I0 = imread('../images/cameraman.jpg');
subplot(2,2,1); imshow(I0); title('Origin');

I1 = rgb2gray(I0);
subplot(2,2,2); imhist(I1); title('Historgram');

% 用直方图阈值分割
I2 = im2bw(I1, 165/415);
subplot(2,2,3); imshow(I2); title('Hist Segment');

% Ostu类间最大方差分割
level = graythresh(I0);
I3 = im2bw(I0, level);
subplot(2,2,4); imshow(I3); title('Ostu Segment');