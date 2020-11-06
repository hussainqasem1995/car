close all;
clear;
clc
[file,path]=uigetfile({'*.jpg;*.bmp;*.png;*.tif'},'Choose an image');
s=[path,file];
I=imread(s);
% figure;
% imshow(im);



im1 = imresize(I, [480 NaN]);

imgray = rgb2gray(im1);




im = edge(imgray, 'sobel');
% figure;
% imshow(im);



im = imdilate(im, strel('diamond', 2));
% figure;
% imshow(im);
im = imfill(im, 'holes');
% figure;
% imshow(im);
im = imerode(im, strel('diamond',9));
 figure;
 imshow(im);

Iprops=regionprops(im,'BoundingBox','Area', 'Image');
area = Iprops.Area;
count = numel(Iprops);
maxa= area;
boundingBox = Iprops.BoundingBox;
for i=1:count
   if maxa<Iprops(i).Area
       maxa=Iprops(i).Area;
       boundingBox=Iprops(i).BoundingBox;
   end
end 






 %all above step are to find location of number plate
 imbin = imbinarize(imgray);
 im = imcrop(imbin, boundingBox);
 figure;
 imshow(im);
 
 
 %resize number plate to 240 NaN
 im = imresize(im, [200 400]);
    figure;
  imshow(im);
  
R1 = imcrop(im,[5 10 30 190]);
figure;
imshow(R1);





RGB= imcrop(im1,boundingBox);             
figure;
imshow(RGB)
X2 = imcrop(RGB,[1.4 4.22 18.3 160]);
figure;
imshow(X2)











% 
% 
% R2 = imcrop(im,[125 10 290 80]);
% R2 = bwareaopen(~R2,70);
% R2 = imclose(R2,ones(5)); 
%  figure;
%  imshow(R2)
%  
%  
%  R3 = imcrop(im,[60 150 330 200]);
%  figure;
%  imshow(R3)
%  
%  
% R4 = imcrop(im,[70 1 60 137]);
% figure;
% imshow(R4)
% title('Arabic letters')