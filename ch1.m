clear all;
clc;
%{
item=VideoReader('challenge.mp4');
video=read(item);
numberofFrames=item.NumberofFrames;
format='.png';
for i=1:numberofFrames
    si=num2str(i);
    str=strcat('img',si,format);
    Vid=video(:,:,:,i);
    cd C:\Users\Click\OneDrive\Documents\frames
    imwrite(Vid,str);
    cd ..
end
%}
cd C:\Users\Click\OneDrive\Documents\frames
for i=1:215
    k=num2str(i);
    s{i}=strcat('img',k,'.png');
end
im1=imread(s{1});
im2=imread(s{2});
im3=imread(s{61});
im4=imread(s{211});
diff0=im1-im4;
im1=im1-diff0;

diff1=im1-im3;
im1=im1-diff1;

diff2=im1-im2;
im1=im1-diff2;

figure(1);
imshow(im1);

for c=1:215
im=imread(s{c});
diff3=im>im1+29;
for i=1:720
    for j=1:1280
        if diff3(i,j)==1
            
            im(i,j,1)=255;
            im(i,j,2)=0;
            im(i,j,3)=0;
        end
    end
end

baseFileName = sprintf('Image #%d.png', c);
fullFileName = fullfile('C:\Users\Click\OneDrive\Documents\frames2', baseFileName);
imwrite(im, fullFileName);
end
cd C:\Users\Click\OneDrive\Documents\frames2
for i=1:215
    k=num2str(i);
    ss{i}=strcat('Image #',k,'.png');
end
newvideo=VideoWriter('boules_detectees');
open(newvideo);
for i=1:215
    im=imread(ss{i});
    writeVideo(newvideo,im);
end
close(newvideo);
%}