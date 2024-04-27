close all;
clear;


datasetPath = "/data/jamehami/lamb_carcass_une_2021/fat_depth_regression/saddle/hypercube-wise/calibrated_reflectance.mat";
load(datasetPath, 'fatDepthCubeY', 'reflectanceCubeX');
scalar1 = fatDepthCubeY;
cube1 = reflectanceCubeX;

datasetPath = "/data/jamehami/lamb_carcass_une_2022/fat_depth_regression/saddle_100/hypercube-wise/calibrated_reflectance.mat";
% datasetPath = "/data/jmehami/lamb_carcass_une_2021/fat_depth_regression/leg_left_half/hypercube-wise/estimated_reflectance_mehami.mat";
load(datasetPath, 'fatDepthCubeY', 'reflectanceCubeX');
scalar2 = fatDepthCubeY;
cube2 = reflectanceCubeX;

scaler_hypercube_comparison(cube1, scalar1, cube2, scalar2);

% runapp1 = reflectance_fatdepth_viewer(reflectanceCubeX, fatDepthCubeY);
% 
% datasetPath = "/data/jmehami/lamb_carcass_une_2021/fat_depth_regression/leg_left/hypercube-wise/estimated_reflectance_mehami.mat";
% load(datasetPath, 'fatDepthCubeY', 'reflectanceCubeX');
% runapp = reflectance_fatdepth_viewer(reflectanceCubeX, fatDepthCubeY);

%% add legenddddddddd