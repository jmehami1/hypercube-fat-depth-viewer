close all;
clear;

load("reflectance_hypercube_lamb_cut.mat", 'fatDepthCubeY', 'reflectanceCubeX');
runapp = reflectance_fatdepth_viewer(reflectanceCubeX, fatDepthCubeY)