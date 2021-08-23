function [Fx,Fy] = Get_Synthetic_Schlieren(d_matrix)
%Note: output of Rotate_2 is (x,z,y) NOT (y,x,z)
[FX,FZ,FY] = gradient(d_matrix);


%% Integrate through a line to create schleron image (sum all components in Z
%direction)
Fx = sum(FZ,2);
Fy = sum(FY,2);

%Converting (Nx1xM) matrix to (MxN) to match origional
Fx = squeeze(Fx);
Fy = squeeze(Fy);

Fx = Fx';
Fy = Fy';
end