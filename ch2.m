clear all;
clc;

cd C:\Users\Click\OneDrive\Documents
item=VideoReader('defi.mp4');
video=read(item);
numberofFrames=item.NumberofFrames;
format='.png';
for i=1:numberofFrames
    si=num2str(i);
    str=strcat('img',si,format);
    Vid=video(:,:,:,i);
    cd C:\Users\Click\OneDrive\Documents\frames3
    imwrite(Vid,str);
    cd ..
end

cd C:\Users\Click\OneDrive\Documents\frames3

for c=1:5400
k=num2str(c);
s{c}=strcat('img',k,'.png');
im=imread(s{c});
img=rgb2gray(im);
baseFileName = sprintf('Image #%d.png', c);
fullFileName = fullfile('C:\Users\Click\OneDrive\Documents\frames4', baseFileName);
imwrite(img, fullFileName);
end

cd C:\Users\Click\OneDrive\Documents\frames4
for c=1:5400
k=num2str(c);
s{c}=strcat('Image #',k,'.png');
end
f2=30;
f1=13;

while f2<=1596
  for c=f1:f2
    if c<f2 && c>f1
        im=imread(s{c});
        img=im;
        im2=imread(s{c+1});
        im3=imread(s{c-1});
        for i=1:480
            for j=1:854
                M1=im(i,j);
                M2=im2(i,j);
                M3=im3(i,j);
                if M1>M2 && M1>M3
                    img(i,j)=M1;
                else
                    if M2>M3
                        img(i,j)=M2;
                    else
                        img(i,j)=M3;
                    end
                end
            end
        end
    else
        if c==f2
             im=imread(s{c});
        img=im;
        im2=imread(s{c-1});
        im3=imread(s{c-2});
        for i=1:480
            for j=1:854
                M1=im(i,j);
                M2=im2(i,j);
                M3=im3(i,j);
                if M1>M2 && M1>M3
                    img(i,j)=M1;
                else
                    if M2>M3
                        img(i,j)=M2;
                    else
                        img(i,j)=M3;
                    end
                end
            end
        end
        else
              im=imread(s{c});
        img=im;
        im2=imread(s{c+1});
        im3=imread(s{c+2});
        for i=1:480
            for j=1:854
                M1=im(i,j);
                M2=im2(i,j);
                M3=im3(i,j);
                if M1>M2 && M1>M3
                    img(i,j)=M1;
                else
                    if M2>M3
                        img(i,j)=M2;
                    else
                        img(i,j)=M3;
                    end
                end
            end
        end
        end
    end
     
    
    
        baseFileName = sprintf('Image #%d.png', c);
fullFileName = fullfile('C:\Users\Click\OneDrive\Documents\frames5', baseFileName);
imwrite(img, fullFileName);

  end
  f1=input(['Entrez f1 debut de scene ']);
  f2=input(['Entrez f2 fin de scene ']);
end

cd C:\Users\Click\OneDrive\Documents\frames5
newvideo=VideoWriter('video_corrige.mp4');
open(newvideo);
for i=13:1596
    im=imread(s{i});
    writeVideo(newvideo,im);
end
close(newvideo);
