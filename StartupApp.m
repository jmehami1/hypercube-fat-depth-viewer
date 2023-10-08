close all;
clear;

load("dataset/reflectance_hypercube_lamb_cut.mat", 'fatDepthCubeY', 'reflectanceCubeX');
runapp = reflectance_fatdepth_viewer(reflectanceCubeX, fatDepthCubeY);