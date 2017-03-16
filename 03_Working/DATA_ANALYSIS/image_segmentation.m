close all
clear

%% Image Segmentation
rgb = imread('durian4.jpg');

hsvImage = rgb2hsv(rgb) ;

hsv_image = hsvImage(:,:,1);
BW_hsv = im2bw(hsv_image,0.1);
BW_hsv = bwareaopen(BW_hsv,100); %ź�բ��
figure
imshow(BW_hsv);
title('kan image');



BW = im2bw(rgb,0.2);
BW_Ereskan = BW_hsv&BW;
BW_Ereskan = bwareaopen(BW_Ereskan, 50); %ź�բ��
BW = not(BW_Ereskan);
figure
imshow(BW);
title('bitwise image');


se90 = strel('line', 18, 90); % expand size of line 90 degree
se0 = strel('line',18, 0);
BWsdil = imdilate(BW, [se90 se0]); %�����բ��
BW2 = bwareaopen(BWsdil, 600); %ź�բ��

BW3 = not(BW2); %��Ѻ��
se90 = strel('line', 5,90); % expand size of line 90 degree
se0 = strel('line',5,0);
BWsdil = imdilate(BW3, [se90 se0]); %�����բ��
invertBWsdil = not(BWsdil); %��Ѻ��
BW4 = bwareaopen(invertBWsdil, 800); %ź�բ��

invertBWsdil = not(BW4); %��Ѻ��
BW4 = bwareaopen(invertBWsdil, 500); %ź�բ��

figure
imshow(BW4);
title('identify durian area');


%% Durian count




BW_filled = imfill(BW4,'holes');
[B,L,N,A] = bwboundaries(BW_filled,'noholes');



figure
imshow(label2rgb(L, @jet, [.5 .5 .5]))%% dummyplot



[rowAll,columnAll,z1] = size(rgb);

position = zeros(length(B),2);
    
for k = 1:length(B)
    %%%  Plot edge
   boundary = B{k};
   plot(boundary(:,2), boundary(:,1), 'w', 'LineWidth', 2)
   
   %%% Set position
   numericCells = B(k,1);
   arrayPo = cell2mat(numericCells);
   
   borderX = 15;
   borderY = 15;
   
   minX = 0 + borderX;
   maxX = columnAll - borderX;
   
   minY = 0 + borderY;
   maxY = rowAll - borderY;
   [sizeX,sizeY] = size(arrayPo);
   for j = 1:sizeX
       xValue = arrayPo(j,2);
       yValue = arrayPo(j,1);
       if (xValue > minX) && (xValue < maxX) && (yValue > minY) && (yValue < maxY)
           position(k,1) = xValue;
           position(k,2) = yValue;
       end
   end 
   
end

number = 1:length(B);
box_color = {rand(1,length(B))};
RGB1 = insertText(label2rgb(L, @jet, [.5 .5 .5]),position,number,'FontSize',13,'BoxOpacity',1,'TextColor','black');
imshow(RGB1);

figure
imshow(label2rgb(L, @jet, [.5 .5 .5]))%% dummyplot

RGB2 = insertText(rgb,position,number,'FontSize',13,'BoxOpacity',1,'TextColor','black');
imshow(RGB2);
title('Durian Count');
