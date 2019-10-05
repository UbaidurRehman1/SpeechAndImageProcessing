#--------------------------------Part a---------------------------#
reading image
img = imread("test.jpg");

# showing image
f = imshow(img);
#waitfor(f)

#converting image into double 
double_img = double(img);
f = imshow(double_img);
#waitfor(f);

#converting to gray scale image
gray_scale_image=rgb2gray(img);
f = imshow(gray_scale_image);
#waitfor(f);

#-------------------------------Part b----------------------------#
# 2-dimensional Fourier transform it return complex numbers 
# getting fast forier transfor 
fft = fft2(gray_scale_image);

# gettign magnitude
fft = abs(fft);
f = imshow(fft, [0, 4000]);

#inverse
inv = ifft2(ceil(mod((real(fft)), 255)));
f = imshow(inv, [0, 1000]);
waitfor(f);
# getting magnitude

imshow(orgImg, [0, 10000]);

#------------------------------Part c ----------------------------#
array = fft;
array(100:200, 100:200) = 0;
array = ifft2(ceil(mod((real(array)), 255) + 1));
f = imshow(array, [0, 50]);
waitfor(f)

#---------------------------- Pard d -----------------------------#
array = fft;
array(145:155, 145:155) = 0;
inv = ifft2(ceil(mod((real(array)), 255) + 1));
f = imshow(array, [0, 1150]);
waitfor(f);



