%% Create an Example Image:
rand('seed', 1982);
n = 16;
myImg= rand(n,n)*.2 + .5;


%% Normalize the Image:
myRange = getrangefromclass(myImg(1));
newMax = myRange(2);
newMin = myRange(1);

myImgNorm = (myImg - min(myImg(:)))*(newMax - newMin)/(max(myImg(:)) - min(myImg(:))) + newMin;

%% Display the Image:
figure(42);
clf;

% Display the original:
subplot(2,2,1);
imagesc(myImg);
set(gca, 'clim', [0,1]);
title('(1) Original Image');

% Display the hist of the original:
subplot(2,2,3);
hist(myImg(:))
xlim([0,1]);
title('(2) Histogram Of Original Image');

% Display the normalized image:
subplot(2,2,2);
imagesc(myImgNorm);
title('(3) Normalized Image');

% Display the hist of the normalized image:
subplot(2,2,4);
hist(myImgNorm(:))
title('(4) Histogram of Normalized Image');
xlim([0,1]);

colormap gray