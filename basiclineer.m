clc,clear all,close all;
%This data set gives average masses for women as a function of their height in a sample of American women of age 30–39.
%Veri seti https://www.kaggle.com/tmcketterick/heights-and-weights adresi üzerinden alınmıştır.
%Bu veri seti, 30-39 yaş arasındaki Amerikalı kadınların bir örneğinde, kadınlar için boylarının bir fonksiyonu olarak ortalama kütleler vermektedir.
%test.csv dosyası içeresinde Height(Boy) ve Weight(Kilo) bilgileri bulunmaktadır.
%Height için x, Weight için y değişkenleri kabul edilecektir.
%küçük kareler formülü için y = m*x +b
%sırasıyla m, b değerleri bulunur tahmini x için değer üretilir.
%Asım MISIRLI
V=importdata('data.csv');
veri=V.data;
x=veri(:,1);
y=veri(:,2);
x_toplam=sum(x);
y_toplam=sum(y);
%toplam elaman sayısını verir.
N=length(x);
x_kare=0;
xy_carpim=0;

%elaman sayısıne kadar x değerlerin karesini toplar.
%x ile y değerlerin indis çarpımını yapar.
for i=1:N
    x_kare=x_kare+x(i)^2;
    xy_carpim=xy_carpim+x(i)*y(i);
    
end
%formüldeki y= m*x+b değerinde m'yi bulmak için kullanılan kural
m=((xy_carpim*N)-(x_toplam*y_toplam))/((x_kare*N)-(x_toplam^2));

%formüldeki y= m*x+b değerinde b'yi bulmak için kullanılan kural

b=(y_toplam-(m*x_toplam))/N;

%Veri seti içeresinde gelen x değerlerine göre yerine koyup hata payinı hesaplar
%Örnek,x(1) için  y=61.2722*1.4700+( -39.0620) olarak hatapayı hesaplanır.
%Döngü haline alınarak hata payı hesaplanır
for i=1:N
    tahmini_y=m*x(i)+b;
    hata_payi(i,1)=tahmini_y-y(i);

end
%x,y,hata payini ekrana yazdırır
sonuc=[x,y,hata_payi]

    



