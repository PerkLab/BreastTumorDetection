% This file takes in two seperate sets of images
% LabeledPath: Path to images which have tumor projection 
%unLabeledPath: Path to original images
%numImages: total number of ultrasound images, in two above paths (these
%should be the same)
% tumorPath: Path to location to store all images with tumor in them
% nonTumorPath: Path to location to store all images without a tumor 
% labeldTumorPath: Path to location to store labels on tumor images (these
% images should be the corresponding labels of images stored in tumorPath
% location)
% labeldNonTumorPath: Path to location to store labels on non tumor images (these
% images should be the corresponding labels of images stored in nonTumorPath
% location)
function [labeledImages, nonImages, tumorImages] = seperateClasses(labeledPath, unlabeledPath, numImages, tumorPath, nonTumorPath, labeledTumorPath, labeledNonTumorPath)
tumorImages = {};
labeledImages = {};
nonImages = {};
countTumor = 1;
countNonTumor = 1;
for i=1:numImages
    index = i - 1;
    if index < 10
        labeledIim = strcat(labeledPath, 'image_0000');
        labeledIim = strcat(labeledIim, string(index));
        labeledIim = strcat(labeledIim, '.png');
        labeledIim = char(labeledIim);
        
        unlabeledIim = strcat(unlabeledPath, 'image_0000');
        unlabeledIim = strcat(unlabeledIim, string(index));
        unlabeledIim = strcat(unlabeledIim, '.png');
        unlabeledIim = char(unlabeledIim);
    elseif index < 100
        labeledIim = strcat(labeledPath, 'image_000');
        labeledIim = strcat(labeledIim, string(index));
        labeledIim = strcat(labeledIim, '.png');
        labeledIim = char(labeledIim);
        
        unlabeledIim = strcat(unlabeledPath, 'image_000');
        unlabeledIim = strcat(unlabeledIim, string(index));
        unlabeledIim = strcat(unlabeledIim, '.png');
        unlabeledIim = char(unlabeledIim);
    else
        labeledIim = strcat(labeledPath, 'image_00');
        labeledIim = strcat(labeledIim, string(index));
        labeledIim = strcat(labeledIim, '.png');
        labeledIim = char(labeledIim);
        
        unlabeledIim = strcat(unlabeledPath, 'image_00');
        unlabeledIim = strcat(unlabeledIim, string(index));
        unlabeledIim = strcat(unlabeledIim, '.png');
        unlabeledIim = char(unlabeledIim);
    end
    cropLabledIm = cropImage(labeledIim);
    resizeLabledIm = resizeImage(cropLabledIm);
    labeledIm = zeros(224,224);
    
    cropUnlabledIm = cropImage(unlabeledIim);
    resizeUnlabledIm = resizeImage(cropUnlabledIm);
    %Creating image labels 
    tumor = 0;
    % checking for green pixels, ie tumor present 
    for j=1:224
        for k=1:224
            if resizeLabledIm(j,k,2) == 255
                if resizeLabledIm(j,k,1) < 50
                    labeledIm(j,k) = 1;
                    tumor = 1;
                end
            end
        end
    end
    labeledImages{i,1} = labeledIm;
    if tumor == 1           
        tumorImages{countTumor,1} = resizeLabledIm;
        imName = char(strcat(strcat(strcat(tumorPath,'image_'),string(countTumor)),'.jpeg'));
        imwrite(resizeUnlabledIm, imName);
        imLabeledName = char(strcat(strcat(strcat(labeledTumorPath,'image_'),string(countTumor)),'.jpeg'));
        imwrite(labeledIm, imLabeledName);
        countTumor = countTumor + 1;
    else
        nonImages{countNonTumor, 1} = resizeLabledIm;
        imName = char(strcat(strcat(strcat(nonTumorPath, 'image_'), string(countNonTumor)),'.jpeg'));
        imwrite(resizeUnlabledIm, imName);
        imLabeledName = char(strcat(strcat(strcat(labeledNonTumorPath,'image_'),string(countNonTumor)),'.jpeg'));
        imwrite(labeledIm, imLabeledName);
        countNonTumor = countNonTumor + 1;
    end
end