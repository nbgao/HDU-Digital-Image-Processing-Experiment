bw = imread('../IMAGE/Boat.tiff');
% 定义长度为11,与水平方向夹角为90°的线性结构
se = strel('line',11,90);
bw2 = imdilate(bw,se);

figure;
subplot(1,3,1); imshow(bw); title('Original');
subplot(1,3,2); imshow(bw2); title('Dilated (line)');

se = strel('ball',5,5);
bw3 = imdilate(bw,se);
subplot(1,3,3); imshow(bw3); title('Dilated (ball)');