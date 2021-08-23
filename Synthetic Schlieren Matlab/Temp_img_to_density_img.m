function [rho] = Temp_img_to_density_img(temp_img)

pressure = 101325;  %Pressure at sea level [Pa]  Change if needed
R = 287.05; %J/(kg.K)

%Image will be 8 bit values, need to convert those values to temperature
%based on min and max temperature

% Tmax = input('Max temp for  [K]: ');
% Tmin = input('Min temp for image [K]: ');

%Can preset values for faster testing
Tmax = 160.2+273;
Tmin = 18.5+273;



%Converts to grayscale (image should be grayscale already)
imgT = rgb2gray(temp_img);  %COLOR MAPPING IS VERY RELEVENT, WE RECOMEND USING GRAYSCALE AS A DEFAULT for flame images
imgT = double(imgT);

%Map values of T to reflect actual Temperature values, no longer an 'image'
T = ((imgT+1)./256)*(Tmax-Tmin) + Tmin;


%convert temperature to density
% density = pressure / (R * T )

rho = pressure./(R.*T);


end