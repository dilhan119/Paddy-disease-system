clear all, close all;

folder_name = uigetdir('C:\','select the blast image folder');

for imname = 1:30
    
    filename = [folder_name '\' int2str(imname) '.jpg'];  
    display(filename);
    I = imread(filename);
    I = imresize(I,[1000,1000]);
    % gray scaling
    I = rgb2gray(I);
    % averaing filter
    h = fspecial('average');
    im = imfilter(I,h,'symmetric');
    % thresholding the image
%     BW = im2bw(im,graythresh(im));
%     BW = ~BW;
    % canny edge detector
    image = edge(im,'canny');
    image = image.*255.00;
    for i = 1:1000
        for j = 1:1000
        array(imname,1000*(i-1)+j) = image(i,j);
        end
    end
    
end
X = array;
Y = {'brown';'brown';'brown';'brown';'brown';'brown';'brown';'brown';'brown';'brown';...
    'brown';'brown';'brown';'brown';'brown';'brown';'brown';'brown';'brown';'brown';...
    'n_bro';'n_bro';'n_bro';'n_bro';'n_bro';'n_bro';'n_bro';'n_bro';'n_bro';'n_bro'};

SVMModel = fitcsvm(X,Y);
