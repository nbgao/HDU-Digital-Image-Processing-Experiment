Image1 = imread('Image1-2.1.jpg');
Image2 = imread('Image1-2.2.jpg');

h1 = fspecial('average', 3);
h2 = fspecial('average', 7);

Image1_avg3 = Filter(h1, Image1);
Image1_avg7 = Filter(h2, Image1);
Image2_avg3 = Filter(h1, Image2);
Image2_avg7 = Filter(h2, Image2);

figure;
subplot(2,3,1); imshow(Image1); title('Pepper Noise Image');
subplot(2,3,2); imshow(Image1_avg3, []); title('3*3 Average Filter');
subplot(2,3,3); imshow(Image1_avg7, []); title('7*7 Average Filter');
subplot(2,3,4); imshow(Image2); title('Gaussian Noise Image');
subplot(2,3,5); imshow(Image2_avg3, []); title('3*3 Average Filter');
subplot(2,3,6); imshow(Image2_avg7, []); title('7*7 Average Filter');



Image3_avg3 = RGBFilter(Image1, 3);
Image3_avg7 = RGBFilter(Image1, 7);
Image4_avg3 = RGBFilter(Image2, 3);
Image4_avg7 = RGBFilter(Image2, 7);

figure;
subplot(2,3,1); imshow(Image1); title('Pepper Noise Image');
subplot(2,3,2); imshow(Image3_avg3, []); title('3*3 Average Filter');
subplot(2,3,3); imshow(Image3_avg7, []); title('7*7 Average Filter');
subplot(2,3,4); imshow(Image2); title('Gaussian Noise Image');
subplot(2,3,5); imshow(Image4_avg3, []); title('3*3 Average Filter');
subplot(2,3,6); imshow(Image4_avg7, []); title('7*7 Average Filter');

