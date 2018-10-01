% Crops image that includes entire red slice of 3D slicer to only include
% ultrasound data 
function cropImage = cropImage(image)
im = imread(image);
cropImage = imcrop(im,[106.5 0.5 294 318]);
%imshow(im);
%figure();
%imshow(cropImage);
end