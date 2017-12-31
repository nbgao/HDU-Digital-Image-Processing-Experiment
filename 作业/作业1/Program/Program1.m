Image1 = imread('Image1-1.1.png');
Image2 = imread('Image1-1.2.png');
Image3 = HistEqualize(I);
Image4 = histeq(I);

figure;
subplot(2,3,1); imshow(Image1); title('Origin Image');
subplot(2,3,2); imhist(Image1); title('Origin Histogram');
subplot(2,3,3); imshow(Image2); title('Target Image');
subplot(2,3,4); imshow(Image3); title('HistEqualize Image');
subplot(2,3,5); imhist(Image3); title('Output Histogram');
subplot(2,3,6); imshow(Image4); title('Histeq Image');

figure;
imshow(Image4); title('HistEqualize Image')