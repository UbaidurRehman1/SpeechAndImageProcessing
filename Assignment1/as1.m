% read the image 
pic = imread('image.jpg'); 
 
%getting rows and columns of the image 
r = size(pic, 1); 
c = size(pic, 2); 
 
% creat matrix for red blur and green plane
R = zeros(r, c, 3); 
G = zeros(r, c, 3); 
B = zeros(r, c, 3); 
 
 
% storing the corresponding color plane 
% red plane 
R(:, :, 1) = pic(:, :, 1); 
 
% green plane 
G(:, :, 2) = pic(:, :, 2); 
 
% blue plane 
B(:, :, 3) = pic(:, :, 3); 
 
% displaying the images 
subplot(2,2,1);
imshow(pic);
title('Orignal Image')
 
subplot(2,2,2);
imshow(uint8(R)); 
title('Red Plane');
 
subplot(2,2,3);
imshow(uint8(G));
title('Green Plane')
 
subplot(2,2,4);
imshow(uint8(B));
title('Blue Plane');


%task 2
%rgb to hsi
 
pic = imread('image.jpg');
task2Pic = double(pic)/255;
red = task2Pic(:, :, 1);
green = task2Pic(:, :, 2);
blue = task2Pic(:, :, 3);
 
%for H (hue) calculation.
numirator = 1/2*((red-green)+(red+green));
denom = sqrt((red-green).^2+((red+green).*(green+blue)));
 
hue = acosd(numirator./(denom+.0000001)); 
%small number is added to avoid divided by 0 exception
 
%If B>G then H= 360-Theta
hue(blue>green)=360-hue(blue>green);
 
%Normalize to the range [0 1]
hue = hue/360;
 
%for saturation calculation
sat = 1-(3./(sum(task2Pic,3)+.0000001)).*min(task2Pic,[],3);
 
%for intensity calculation
intens = sum(task2Pic,3)./3;
 
%HSI
HSI = zeros(size(pic));
HSI(:, :, 1) = hue;
HSI(:, :, 2) = sat;
HSI(:, :, 3) = intens;
 
subplot(2,2,1);
imshow(HSI);
title('Image In HSI');
 
%rgb to cmy
 
task2Pic = im2double(task2Pic);
r = task2Pic(:, :, 1);
g = task2Pic(:, :, 2);
b = task2Pic(:, :, 3);
 
c = 1-r;
m = 1-g;
y = 1-b;
 
CMY = cat(3,c,m,y);
 
subplot(2,2,4);
imshow(CMY);
title('Image In CMY');



%difference 
%As we have divided r channel, g channel and b channel. In each channel, we
%see the intensities of respective colors.
%for eaxamle in r channel the image is build from red color intensities.
%The CMY model is actually substractive model and it substract the color
%intensities from the white color. So we see something like a negative
%image.
%HSI is based on situration, hue and intensities. So we see the mixture of
%these above mentioned entities
