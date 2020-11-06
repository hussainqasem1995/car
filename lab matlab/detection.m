close all;
clear;
clc

% Choose a image
image=uigetfile({'*.jpg;*.bmp;*.png;*.tif'},'Choose an image');
s=image;
I=imread(s);
figure;
imshow(I);
title('image RGB');
im1 = imresize(I, [480 NaN]);   % Resize the image, specifying that the output image have 480 rows

imgray = rgb2gray(im1);  %Convert the image to grayscale
im = edge(imgray, 'sobel');  %detect edges using the Sobel method
figure;
subplot(2,2,1)
imshow(im);
title('detect edges');

 im = imdilate(im, strel('diamond', 2)); %dilate the grayscale, binary, or packed binary image IM
subplot(2,2,2)
 imshow(im);
 
  
 im = imfill(im, 'holes');  %Fill holes image and display the result
 subplot(2,2,3)
 imshow(im);

 im = imerode(im, strel('diamond',9));  % Erode the image with the structuring element
 subplot(2,2,4)
 imshow(im);
 
%Below steps are to find location of number plate mojposao
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


imbin = imbinarize(imgray);
im = imcrop(imbin, boundingBox); %crop the number plate area
figure;
subplot(2,2,1);
imshow(im);

%resize number plate to 200 400
im = imresize(im, [200 400]);
R1 = imcrop(im,[5 10 30 190]);
subplot(2,2,2);imshow(R1);

RGB= imcrop(im1,boundingBox);             
subplot(2,2,3);
imshow(RGB);

X2 = imcrop(RGB,[1.4 4.22 12.3 160]);
subplot(2,2,4);
imshow(X2);



R2 = imcrop(im,[135 10 245 83.5]);
R2 = bwareaopen(~R2,70);
R2 = imclose(R2,ones(5));
figure;
imshow(R2);

R3 = imcrop(im,[60 150 330 200]);
figure;
imshow(R3);

R4= imcrop(im,[70 1 70 90]);




   Iprops=regionprops(R2,'BoundingBox','Area', 'Image');
   count = numel(Iprops);
   boundingBox = Iprops.BoundingBox;
   figure;
   for j=1:count
                
            if Iprops(j).Area > 100
             boundingBox=Iprops(j).BoundingBox;
             R= imcrop(R2, boundingBox);
             R = imresize(R, [100 100]);
               subplot(1,5,j)
               imshow(R)
             end
             
   end
   
   
   
         
      for j=1:count
          if Iprops(j).Area > 100
         e=Iprops(j).Image;
         e = imresize(e, [50 50]);
          
         
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
         
         
         
        area22=imcrop(e,[0.5 0.5 4.85 6.2]);%%%------>0
        sum_arae22=sum_(area22);
        
        area23=imcrop(e,[45 0.5 50.5 5.0]);%%%------>0
        sum_arae23=sum_(area23);
        
        area24=imcrop(e,[0.5 44.6 6.19 50.5]);%%%------>0
        sum_arae24=sum_(area24);
        
        area25=imcrop(e,[43.1 44.8 50.5 50.5]);%%%------>0
        sum_arae25=sum_(area25);
         
        area26=imcrop(e,[12.8 12 28.1 26.8]);%%%------>1
        sum_arae26=sum_(area26);
        sum_zero=sum_white(area26);
        
        if (sum_arae22==0 && sum_arae23==0 && sum_arae24==0 && sum_arae25==0 && sum_arae26==sum_zero)
           m(j)=0;
         end
        %%%--------->>zero
         
         
         
       
       
        area38=imcrop(e,[0.5 30.3 16 50.5]);%%%------>0
        sum_arae38=sum_(area38);  
         
        area39=imcrop(e,[40.1 0.5 50.5 8.87]);%%%------>0
        sum_arae39=sum_(area39);
 
        area40=imcrop(e,[33.4 21.6 12.6 15.2]);%%%------>1
        sum_arae40=sum_(area40);
        sum_one=sum_white(area40);
       
        area40_=imcrop(e,[42.4 18.6 50.5 25.6]);%%%------>1
        sum_arae40_=sum_value(area40_);
      
        if (sum_arae38==0 && sum_arae39==0 && sum_arae40==sum_one && sum_arae40_==1)
           m(j)=1;
           
        end
        %%%--------->>one

         area5=imcrop(e,[18.5 0.5 41.5 2]);%%%%----->>1
         sum_arae5=sum_value(area5);
         
         
         area6=imcrop(e,[28.6 12.5 50.5 27]);%%%------>0
         sum_arae6=sum_value(area6);
         
         
         area7=imcrop(e,[3.96 8.2 16.2 14.2]);%%%------>1
         sum_arae7=sum_value(area7);
         
         
         area8=imcrop(e,[0.5 43.9 9.54 50.5]);%%%------>0
         sum_arae8=sum_(area8);
         
          
         if (sum_arae5 == 1 && sum_arae6==0 && sum_arae7==1 && sum_arae8==0)
           m(j)=2;
         end
        %%%%%%%----->>tow
        
           area27=imcrop(e,[34.6 0.5 8.9 3.29]);%%%------>0
        sum_arae27=sum_value(area27);
        
         area28=imcrop(e,[4.85 7.31 43 2.32]);%%%------>1
        sum_arae28=sum_value(area28);
        
        area29=imcrop(e,[6.19 10.4 11.2 8.5]);%%%------>1
        sum_arae29=sum_value(area29);
        
        area30=imcrop(e,[27.6 19.4 50.5 50.5]);%%%------>0
        sum_arae30=sum_(area30);
        
        area31=imcrop(e,[0.5 40.1 8.42 50.5]);%%%------>0
        sum_arae31=sum_(area31);
        
        if (sum_arae27==0 && sum_arae28==1 && sum_arae29==1 && sum_arae30==0 && sum_arae31==0)
           m(j)=3;
         end
         %%%--------->>three
        
        

         
         area9=imcrop(e,[7.98 12.2 15.3 17.1]);%%%------>1
         sum_arae9=sum_value(area9);
                  
       
         area10=imcrop(e,[16 12.3 14.5 17]);%%%------>1
         sum_arae10=sum_value(area10);
                
         
         area11=imcrop(e,[36.3 0.5 50.5 38.3]);%%%------>0
         %sum_of_pixel=sum_(area11);
         sum_arae11=sum_value(area11);
             
         
         area12=imcrop(e,[0 27.4 11.1 9.9]);%%%------>0
         sum_arae12=sum_value(area12);
         
         area13=imcrop(e,[7.75 42.5 27.8 5.4]);%%%------>1
         sum_arae13=sum_value(area13);
 
         if (sum_arae9 == 1 && sum_arae10==1 && sum_arae11==0 && sum_arae12==0 && sum_arae13==1)
           m(j)=4;
          
         end
          
      %%%--------->>four
         
      
        area14=imcrop(e,[7.75 42.5 27.8 5.4]);%%%------>1
        sum_arae14=sum_value(area14);
        
        area15=imcrop(e,[19.1 8.31 17.3 7]);%%%------>1
        sum_arae15=sum_value(area15);
        

        area16=imcrop(e,[14.7 23.4 17 10.2]);%%%------>0
        sum_arae16=sum_value(area16);
        
        
 
         if (sum_arae14 == 1 && sum_arae15==1 && sum_arae16==0 )
          m(j)=5;
         end
          
      %%%--------->>five
      
      
         
         area1=imcrop(e,[5.08 3.74 29.2 7.9]);%%---->>1
         sum_arae1=sum_value(area1);  
         
         area2=imcrop(e,[33 22.3 38 36.5]);%%---->>1
         sum_arae2=sum_value(area2);
         
         area3=imcrop(e,[0 17.1 22.5 50.5]);%%---->>0
         sum_p=sum_(area3);

         area4=imcrop(e,[40.5 0.5 50.5 13.1]);%%----->0
         sum_arae4=sum_value(area4);
      
         if(sum_arae1==1 && sum_arae2==1 && sum_p==0 && sum_arae4==0)
             
           m(j)=6;
         end
       %%%%%%% ---->> six  
         
         
         
        area35=imcrop(e,[16.8 2.5 15.1 7.3]);%%%------>0
        sum_arae35=sum_value(area35);
        
        area36=imcrop(e,[0.5 31.2 8.42 50.4]);%%%------>0
        sum_arae36=sum_value(area36);
     
        area37=imcrop(e,[40.1 38.3 50.5 50.5]);%%%------>0
        sum_arae37=sum_(area37);
        
        if (sum_arae35==0 && sum_arae36==0 && sum_arae37==0)
           m(j)=7;
         end
        %%%--------->>seven  
       
       
       
       
        area32=imcrop(e,[0.5 0.5 9.79 22]);%%%------>0
        sum_arae32=sum_value(area32);
        
        
        area33=imcrop(e,[41.7 0.5 50.5 20.5]);%%%------>0
        sum_arae33=sum_value(area33);
        
        area34=imcrop(e,[21.1 41 9.3 50.5]);%%%------>1
        sum_arae34=sum_value(area34);
        
        area34_=imcrop(e,[1.73 40.8 9.9 5.2]);%%%------>1
        sum_arae34_=sum_value(area34_);
        
        if (sum_arae32==0 && sum_arae33==0 && sum_arae34==0 && sum_arae34_==1)
           m(j)=8;
        end
         
 
        %%%--------->>eight
        
        
        area17=imcrop(e,[15.3 9.08 6.7 2.1]);%%%------>0
        sum_arae17=sum_value(area17);

        area18=imcrop(e,[46.1 0.5 50.5 4.41]);%%%------>0
        sum_arae18=sum_(area18);
        
        
        area19=imcrop(e,[5.5 14.9 30.2 5]);%%%------>1
        sum_arae19=sum_value(area19);
        
        area20=imcrop(e,[0.5 27.2 24.3 50.5]);%%%------>0
        sum_arae20=sum_(area20);
        
        
        area21=imcrop(e,[37.5 30.9 3.2 41]);%%%------>1
        sum_arae21=sum_value(area21);
        

 
         if (sum_arae17==0 && sum_arae18==0 && sum_arae19==1 && sum_arae20==0 && sum_arae21==1 )
           m(j)=9;
         end
          
          else
              m(j)="NaN";
          end
      %%%--------->>nine
         
       end
       
  
%   for i=1:count
%    
%             e=Iprops(i).Image;??? ????? ??????
%             figure;
%             imshow(e);
%   end  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  

 %filter binary image  hussain qasem
 %removes all connected components (objects) that have fewer than 50 pixels
%  im = bwareaopen(im,70);
%  figure;
%  imshow(im);
%     
% % Perform a morphological close operation on the image   
% im = imclose(im,ones(5)); 
% figure;
% imshow(im);
% 
% 
% im = imcrop(im,[35 1 700 120]);
% figure;
% imshow(im);
% 
% 
%  Iprops=regionprops(im,'BoundingBox','Area', 'Image');
%  count = numel(Iprops);
%  boundingBox = Iprops.BoundingBox;
%  for i=1:count
%    
%          boundingBox=Iprops(i).BoundingBox;
%            im1= imcrop(im, boundingBox);
%            im1 = imresize(im1, [100 NaN]);
%           figure;
%            imshow(im1);
%      
%       
%  end 
