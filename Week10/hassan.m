%part a
%I have created image in paint (add 7 disconnected objects)
 
%part b
%read image
im = imread('pic.bmp');
subplot(2, 2, 1);
imshow(im);
 
%converting image 
double_im = im2double(im);
final_img = imcomplement(double_im);
 
%labeling image using bwlabel which 
%is the function of ImageProcessing Package of Matlab
%it assign each disconnected object a unique label
[L, n] = bwlabel(final_img, 4);
 
%adding unique colors to disconnected objects
resultant_img = label2rgb(L, 'hsv', 'k', 'shuffle');
subplot(2, 2, 2);
imshow(resultant_img);
 
%saving image
imwrite(resultant_img, 'blob2.bmp');
