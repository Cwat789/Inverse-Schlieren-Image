clear all;
close all; 

%Load in image of the Temperature Profile
%CHANGE .jpg HERE AND IN ELSE STATEMENT IF USING DIFFERENT FILE TYPES

%Input image SHOULD BE GRAYSCALE as thermal values are generally recorded
%as such
[file,path] = uigetfile('*.jpg');
if isequal(file,0)
   disp('User selected Canceleled');
   
else
   disp(['User selected ', fullfile(path,file)]);
   rgbT=imread(fullfile(path,file),'jpg');
end

%% IMPORTANT: convert any psudocolor images to grayscale below before processing
% vvvvvvv

%%

[rho] = Temp_img_to_density_img(rgbT);

[d_matrix] = Rotate_2(rho);

[Fx,Fy] = Get_Synthetic_Schlieren(d_matrix);


%% Up to user how they want to scale/ display schleron.  Values may be too large/ small and image may appear all one color
%%So please edit how you choose.  Here is how I do it (won't work in all
%%cases)
%%Try: Absolute function, or min/max range values, or mapping

%%Convert matrix to grayscale image and show image
imgx = mat2gray(Fx);
%imgx represents a horizontal slice (most common) and img y represents a
%vertical slice.  Currently showing imgx
imgy = mat2gray(Fx);

subplot(1,2,1);
imshow(imgy);
title('Vertical knife edge Schlieren');
axis off
%Curently showing unfiltered Fy (vertical knife edge).
subplot(1,2,2);
imshow(imgx);
title('Horizontal knife edge Schlieren');
axis off

%% IMPORTANT: Fx and Fy coorespond to orientation of knife edge.  Fx is horizontal, Fy is vertical


