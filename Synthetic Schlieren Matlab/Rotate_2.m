function [matrix3d] = Rotate_2(rho)
%Getting the size of the matrix
[M,N] = size(rho);


matrix3d = zeros(N,N,M);

n = floor(N/2); %Half number of elements in the vector
if rem(N,2) == 1
    r = [n:-1:0,1:n]; %Vector of distances, same size as V array
else
    r = [n:-1:0,1:n-1]; %Vector of distances, same size as V array
end

% Creates a matrix that represents the distance formula
ri = bsxfun(@(x,y)(sqrt(x.^2+y.^2)),r,r');
for j = 1:M    %Here we are iterating through the y matrix
    V = rho(j,:);  %vector "line" at a specific height.  (Symmetrical)
   % use ri vector to interpole V 
   slice = interp1(r(1:n+1),V(1:n+1),ri);
   slice(isnan(slice)) = V(N);  %Sets all NAN values to exterior value of image
    matrix3d(:,:,j) = slice;
end

%IMPORTANT: OUTPUT IS (X,Z,Y) MATRIX
%NOT EXPECTED (Y,X,Z)

end
