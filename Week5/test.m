img = imread("test.jpg");
gray_scale_image=rgb2gray(img);
fft = fft2(gray_scale_image);

f = imshow(fft);
waitfor(f);
inv = ifft2(mod(ceil(abs(fft)), 255) + 1);
inv = uint8(abs(inv));
f = imshow(inv);
waitfor(f);
#mg = ceil(abs(fft));
#imshow(mg, [0, 3000]);

#mg = ceil(mg/255);
#orgImg = ifft2(mg);
#orgImg = ceil(abs(orgImg));
#imshow(orgImg, [0, 200]);
isequal(gray_scale_image, inv)