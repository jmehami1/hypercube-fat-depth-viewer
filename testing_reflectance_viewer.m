% plot reflectance vs hyperspectral bands for spectral signture of a range of fat depths
% TODO: Redesign viewer in MATLAB app designer which that it is interactive
% and you can pick any upper and lower fat depth thresholds

close all;
clear;

load("reflectance_hypercube_lamb_cut.mat", 'fatDepthCubeY', 'reflectanceCubeX');

viewer = ReflectanceScalarViewer(reflectanceCubeX, fatDepthCubeY, 'fat depth');





% [numV, numU, numBands] = size(reflectanceCubeX);
% 
% fatDepthMin = 4.0;
% fatDepthMax = 5.0;
% 
% fatDepthMask = (fatDepthCubeY > fatDepthMin) & (fatDepthCubeY < fatDepthMax);
% [rows, cols] = find(fatDepthMask);
% 
% maskedReflectancesList = zeros(length(rows), numBands);
% idx = 0;
% 
% for b = 1:numBands
%     curReflectanceList = impixel(reflectanceCubeX(:,:,b), cols, rows);
%     maskedReflectancesList(:, b) = curReflectanceList(:,1); 
% end
% 
% 
% figure();
% stdshade(maskedReflectancesList);

