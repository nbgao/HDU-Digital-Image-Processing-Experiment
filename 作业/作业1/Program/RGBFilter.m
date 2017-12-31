function M = RGBFilter(Image, h)
R = Image(:,:,1);
G = Image(:,:,2);
B = Image(:,:,3);

R_ = AverageFilter(R, h);
G_ = AverageFilter(G, h);
B_ = AverageFilter(B, h);

M(:,:,1) = uint8(R_);
M(:,:,2) = uint8(G_);
M(:,:,3) = uint8(B_);

end