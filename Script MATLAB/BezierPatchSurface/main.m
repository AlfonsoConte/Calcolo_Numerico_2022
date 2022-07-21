    clc, close all, clear all

load('teapot');
[r c d np]=size(S);
% % np: numero di patches
ni=20; %number of interpolated values between end control points
u=linspace(0,1,ni); v=u;  
%%Più eleveto è il valore di ni smoother è la superficie ma 
%maggiore è il calcolo computazionale
% % ------------------------------------
% % Cubic Bezier interpolation of control points of each patch
for k=1:np
    Q(:,:,:,k)=bezierpatchinterp(S(:,:,:,k),u,v); %interpolation of kth patch
end
plotbeziersurface3D(S,Q)