clear all
pictureFile='°×³ãµÆ.jpg';
picture=imread(pictureFile);
[line,colu,deepth]=size(picture);
gap=1;
if(colu>200)
   gap=10;
end
y=1:length(10:gap:colu);
x=1:length(10:gap:colu);
% mm
height=103;
width=60;
index=1;
for c=10:gap:colu
for l=1:line
    if picture(l,c,1)>200 && picture(l,c,2)<100 && picture(l,c,3)<100
       y(index)=(line-l)/line*width-width/2;
       x(index)=c/colu*height;
       index=index+1;
       break
    end
end
end
x(x<0)=0;
% figure(1)
% plot(x,y)
n = 102.9;
figure(2)
[X,Y,Z]= cylinder(y,30);
surf(X,Y,Z*n,'FaceAlpha',0.5,'EdgeColor','none')
axis([-30 30 -30 30 0 105])


N =1000;
px =rand(N,3);
px(:,1)=60.*px(:,1)-30;
px(:,2)=60.*px(:,2)-30;
px(:,3)=105.*px(:,3);
hold on
plot3(px(:,1),px(:,2),px(:,3),'o')


X=X(:);
Y=Y(:);
Z=Z(:)*n;
M =[X,Y,Z];
M=unique(M,'rows');
Tri = delaunayn(M);
tn = tsearchn(M, Tri,px); 
IsInside = ~isnan(tn); % Convert to logical vector
Sp = sum(IsInside);

V = Sp/N*(60*60*102.9)