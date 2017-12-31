I0 = imread('../images/test.jpg');

% sobel算子:水平、垂直边缘检测
[I1 t1] = edge(I0, 'sobel', 'horizontal');
[I2 t2] = edge(I0, 'sobel', 'vertical');

% prewitt算子:水平、垂直边缘检测
[I3 t3] = edge(I0, 'prewitt', 'horizontal');
[I4 t4] = edge(I0, 'prewitt', 'vertical');

figure;
subplot(2,2,1); imshow(I1); title('Sobel Horizontal');
subplot(2,2,2); imshow(I2); title('Sobel Vertical');

subplot(2,2,3); imshow(I3); title('Prewitt Horizontal');
subplot(2,2,4); imshow(I4); title('Prewitt Vertical');


% 自定义模版
w45 = [-2 -1 0; -1 0 -1; 0 1 2];
% 45°边缘检测
g45 = imfilter(double(I0), w45);

figure;
subplot(1,2,1); imshow(I0); title('Origin');
subplot(1,2,2); imshow(g45); title('45°edge');

