%Reszie image ro 224 x 224 pixels, these values can be changed 
function resizeImage = resizeImage(cropImage)
resizeImage = imresize(cropImage,[224 224]);
%figure();
%imshow(resizeImage);
end