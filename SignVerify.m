I1 = rgb2gray(imread('sir1.jpg'));
I2 = rgb2gray(imread('sir2.jpg')); 

subplot(2,1,1)
imshow(I1)
figure;
subplot(2,1,2);
imshow(I2)

figure;
points1 = detectHarrisFeatures(I1); plot(points1);
figure;
points2 = detectHarrisFeatures(I2); plot(points2);

[features1,valid_points1] = extractFeatures(I1,points1);
[features2,valid_points2] = extractFeatures(I2,points2);

indexPairs = matchFeatures(features1,features2);

matchedPoints1 = valid_points1(indexPairs(:,1),:);
matchedPoints2 = valid_points2(indexPairs(:,2),:);

figure;
showMatchedFeatures(I1,I2,matchedPoints1,matchedPoints2);

u=matchedPoints2.Metric-matchedPoints1.Metric;

if abs(u)<=0.04 
    disp("Matched");
else
    disp("Not Matched");
end