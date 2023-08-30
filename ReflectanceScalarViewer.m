classdef ReflectanceScalarViewer < handle
    %very basic viewer that shows the disbution of reflectance between and
    %upper and lower threshold values based on a scalar attribute (e.g. fat
    %depth)

    properties
        reflectanceCube
        scalarAttribute
        scalarAttributeName
        scalarAttributeMax
        scalarAttributeMin
        scalarPlotMask
        reflectanceMaskedList
        fig
        sliderMax
        sliderMin
        numBands
    end

    methods
        function obj = ReflectanceScalarViewer(reflectanceCube, scalarAttribute, scalarAttributeName)
            %UNTITLED2 Construct an instance of this class
            %   Detailed explanation goes here
            obj.reflectanceCube = reflectanceCube;
            obj.scalarAttribute = scalarAttribute;
            obj.scalarAttributeName = scalarAttributeName;

            [numV, numU, numBands] = size(reflectanceCube);
            obj.numBands = numBands;


            obj.scalarAttributeMax = max(scalarAttribute, [], "all");
            obj.scalarAttributeMin = min(scalarAttribute, [], "all");

            obj.sliderMax = obj.scalarAttributeMax;
            obj.sliderMin = obj.scalarAttributeMin;

            obj.fig = figure("Name", ['Reflectance ', obj.scalarAttributeName, ' viewer']);

            obj.newscalarplotmask(obj.scalarAttributeMin, obj.scalarAttributeMax)

            obj.plotreflectancestdscalarattribute()


        end

        function obj = newscalarplotmask(obj, minValue, maxValue)
            %threshold scalar values between min and max
            obj.scalarPlotMask = (obj.scalarAttribute >= minValue) & (obj.scalarAttribute <= maxValue);

            [rows, cols] = find(obj.scalarPlotMask);

            obj.reflectanceMaskedList = zeros(length(rows), obj.numBands);

% Go through each reflectance channel and find pixels that fit threshold, and add reflectance value to list           
            for b = 1:obj.numBands
                curReflectanceList = impixel(obj.reflectanceCube(:,:,b), cols, rows);
                obj.reflectanceMaskedList(:, b) = curReflectanceList(:,1);
            end

        end

        function obj = plotreflectancestdscalarattribute(obj)
            clf(obj.fig);

            stdshade(obj.reflectanceMaskedList); hold on;
            ylabel('Reflectance');
            xlabel('Hyperspectral band number (change to wavelength)')
            grid on;
            xlim([0, obj.numBands]);
        end
    end
end