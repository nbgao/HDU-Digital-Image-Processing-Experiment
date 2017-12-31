function M = Filter(h, Image)
R = Image(:,:,1);
G = Image(:,:,2);
B = Image(:,:,3);

R_ = filter2(h, R);
G_ = filter2(h, G);
B_ = filter2(h, B);

M(:,:,1) = uint8(R_);
M(:,:,2) = uint8(G_);
M(:,:,3) = uint8(B_);

end