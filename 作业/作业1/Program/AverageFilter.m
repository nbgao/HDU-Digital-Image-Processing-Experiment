function M = AverageFilter(Image, h)
Conv = ones(h);
shape = size(Image);
H = shape(1);
L = shape(2);
H_ = H - h + 1;
L_ = L - h + 1;

Image = Image(:,:,1);

M = uint8(zeros(H_, L_));
for i = 1:H_
    for j = 1:L_
        s = uint16(0);
        pi = i + floor(h/2);
        pj = j + floor(h/2);
        for p = -floor(h/2):floor(h/2)
            for q = -floor(h/2):floor(h/2)
                s = s + uint16(Image(pi+p,pj+q)*1);
            end
        end
        M(i,j) = uint8(s/(h*h));
    end
end
