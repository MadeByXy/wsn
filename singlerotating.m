clear;
clc;
n = 400;
j=1;
L=100;
X = rand(1,n)*L;
Y = rand(1,n)*L;
netloc=[X;Y];
loc_sort=(sortrows(netloc'))';
X=loc_sort(1,1:50);
Y=loc_sort(2,1:50);
netloc1=[X;Y];
l=1;
%range 0-10
for i=1:n
    if (loc_sort(1,i)>=0 && loc_sort(1,i)<=10)
        range1(1:2,l)=loc_sort(1:2,i);
        l=l+1;
    end
end

l=1;
%range 10-20
for i=1:n
    if (loc_sort(1,i)>=10 && loc_sort(1,i)<=20)
        range2(1:2,l)=loc_sort(1:2,i);
        l=l+1;
    end
end

l=1;
%range 20-30
for i=1:n
    if (loc_sort(1,i)>=20 && loc_sort(1,i)<=30)
        range3(1:2,l)=loc_sort(1:2,i);
        l=l+1;
    end
end

l=1;
%range 30-40
for i=1:n
    if (loc_sort(1,i)>=30 && loc_sort(1,i)<=40)
        range4(1:2,l)=loc_sort(1:2,i);
        l=l+1;
    end
end

l=1;
%range 40-50
for i=1:n
    if (loc_sort(1,i)>=40 && loc_sort(1,i)<=50)
        range5(1:2,l)=loc_sort(1:2,i);
        l=l+1;
    end
end

l=1;
%range 50-60
for i=1:n
    if (loc_sort(1,i)>=50 && loc_sort(1,i)<=60)
        range6(1:2,l)=loc_sort(1:2,i);
        l=l+1;
    end
end

l=1;
%range 60-70
for i=1:n
    if (loc_sort(1,i)>=60 && loc_sort(1,i)<=70)
        range7(1:2,l)=loc_sort(1:2,i);
        l=l+1;
    end
end

l=1;
%range 70-80
for i=1:n
    if (loc_sort(1,i)>=70 && loc_sort(1,i)<=80)
        range8(1:2,l)=loc_sort(1:2,i);
        l=l+1;
    end
end

l=1;
%range 80-90
for i=1:n
    if (loc_sort(1,i)>=80 && loc_sort(1,i)<=90)
        range9(1:2,l)=loc_sort(1:2,i);
        l=l+1;
    end
end

l=1;
%range 90-100
for i=1:n
    if (loc_sort(1,i)>=90 && loc_sort(1,i)<=100)
        range10(1:2,l)=loc_sort(1:2,i);
        l=l+1;
    end
end

range1=sortrows(range1',2)';
range2=sortrows(range2',2)';
range3=sortrows(range3',2)';
range4=sortrows(range4',2)';
range5=sortrows(range5',2)';
range6=sortrows(range6',2)';
range7=sortrows(range7',2)';
range8=sortrows(range8',2)';
range9=sortrows(range9',2)';
range10=sortrows(range10',2)';


Eamp=100*0.000000000001;
L=2000;
ETX=50*0.000000001;
ERX=50*0.000000001;
EDA=5*0.000000001;
flag=0;
flag_20=0;
flag_50=0;
%Coordinates of the sink
sink.x=50;
sink.y=150;
Eo=1; % Initial energy

%Parameters for heterogenity
m=0;
a=0;
b=0;
rmax=20000;

%Lengths of all chains
l1=length(range1);
l2=length(range2);
l3=length(range3);
l4=length(range4);
l5=length(range5);
l6=length(range6);
l7=length(range7);
l8=length(range8);
l9=length(range9);
l10=length(range10);

x1=l1;
x2=l1+l2;
x3=l1+l2+l3;
x4=l1+l2+l3+l4;
x5=l1+l2+l3+l4+l5;
x6=l1+l2+l3+l4+l5+l6;
x7=l1+l2+l3+l4+l5+l6+l7;
x8=l1+l2+l3+l4+l5+l6+l7+l8;
x9=l1+l2+l3+l4+l5+l6+l7+l8+l9;
x10=l1+l2+l3+l4+l5+l6+l7+l8+l9+l10;

range2=[zeros(2,x1),range2];
range3=[zeros(2,x2),range3];
range4=[zeros(2,x3),range4];
range5=[zeros(2,x4),range5];
range6=[zeros(2,x5),range6];
range7=[zeros(2,x6),range7];
range8=[zeros(2,x7),range8];
range9=[zeros(2,x8),range9];
range10=[zeros(2,x9),range10];


for i=1:x1
    S(i).X=range1(1,i);
    S(i).Y=range1(2,i);
    S(i).E=Eo;
    S(i).ENERGY=0;
end

for i=1+x1:x2
    S(i).X=range2(1,i);
    S(i).Y=range2(2,i);
    S(i).E=Eo;
    S(i).ENERGY=0;
end

%no. of nodes in chain 3
for i=1+x2:x3
    S(i).X=range3(1,i);
    S(i).Y=range3(2,i);
    S(i).E=Eo;
    S(i).ENERGY=0;
end

%no. of nodes in chain 4
for i=1+x3:x4
    S(i).X=range4(1,i);
    S(i).Y=range4(2,i);
    S(i).E=Eo;
    S(i).ENERGY=0;
end

%no. of nodes in chain 5
for i=1+x4:x5
    S(i).X=range5(1,i);
    S(i).Y=range5(2,i);
    S(i).E=Eo;
    S(i).ENERGY=0;
end

%no. of nodes in chain 6
for i=1+x5:x6
    S(i).X=range6(1,i);
    S(i).Y=range6(2,i);
    S(i).E=Eo;
    S(i).ENERGY=0;
end

%no. of nodes in chain 7
for i=1+x6:x7
    S(i).X=range7(1,i);
    S(i).Y=range7(2,i);
    S(i).E=Eo;
    S(i).ENERGY=0;
end

%no. of nodes in chain 8
for i=1+x7:x8
    S(i).X=range8(1,i);
    S(i).Y=range8(2,i);
    S(i).E=Eo;
    S(i).ENERGY=0;
end

%no. of nodes in chain 9
for i=1+x8:x9
    S(i).X=range9(1,i);
    S(i).Y=range9(2,i);
    S(i).E=Eo;
    S(i).ENERGY=0;
end

%no. of nodes in chain 10
for i=1+x9:x10
    S(i).X=range10(1,i);
    S(i).Y=range10(2,i);
    S(i).E=Eo;
    S(i).ENERGY=0;
end

for i=1:1:n*m
    c=ceil(rand*100);
    if (c~=x1 && c~=x2 && c~=x3 && c~=x4 && c~=x5 && c~=x6 && c~=x7 && c~=x8 && c~=x9 && c~=x10)
        S(c).E=Eo*(1+a);
        S(c).ENERGY=1;
    else
        i=i-1;
    end
    
end

for i=1:1:n
    if (i==x1||i==x2||i==x3||i==x4||i==x5||i==x6||i==x7||i==x8||i==x9||i==x10)
    S(i).E=Eo*(1+b);
    S(i).ENERGY=2;
    end
end

H=1;
for r=1:rmax
    r
    hold off;
    figure(1);
    dead=0;
    
    % First Chain
    A=0;
    k=1;
    B=0;   % Leader Vector
    q=0;
    C=0;   % Distances Leader Vector
    
    for j=1:l1
        if (S(j).E>0)
            A(k)=j;
            k=k+1;
        else
            dead=dead+1;
            plot(S(j).X,S(j).Y,'r.');
            hold on;
        end
    end
    k=k-1;
    for i=1:k
        plot(sink.x,sink.y,'rx');
        if (S(A(i)).ENERGY==1)
            plot(S(A(i)).X,S(A(i)).Y,'r+');
        elseif (S(A(i)).ENERGY==2)
            plot(S(A(i)).X,S(A(i)).Y,'m^');
        else
            plot(S(A(i)).X,S(A(i)).Y,'bo');
        end
        if (i==k)
            dist=sqrt((S(A(i)).X-sink.x)^2+(S(A(i)).Y-sink.y)^2);
            q=q+1;
            B(q)=A(i);
            C(q)=dist;
            %line ([S(A(i)).X sink.x],[S(A(i)).Y sink.y],'Color','r','LineStyle',':');
        else
            dist=sqrt((S(A(i)).X-S(A(i+1)).X)^2+(S(A(i)).Y-S(A(i+1)).Y)^2);
            line ([S(A(i)).X S(A(i+1)).X],[S(A(i)).Y S(A(i+1)).Y],'LineStyle',':');
            S(A(i)).E = S(A(i)).E-((ETX+EDA)*L + Eamp*L*(dist*dist));
        end
        
%         if i<k
%         S(A(i+1)).E = S(A(i+1)).E-(ERX*L);
%         end
        hold on;
    end
    
    
    % Second Chain
    A=0;
    k=1;
    for j=1+x1:x2
        if (S(j).E>0)
            A(k)=j;
            k=k+1;
        else
            dead=dead+1;
            plot(S(j).X,S(j).Y,'r.');
            hold on;
        end
    end
    k=k-1;
    for i=1:k
        if (S(A(i)).ENERGY==1)
            plot(S(A(i)).X,S(A(i)).Y,'r+');
        elseif (S(A(i)).ENERGY==2)
            plot(S(A(i)).X,S(A(i)).Y,'m^');
        else
            plot(S(A(i)).X,S(A(i)).Y,'bo');
        end
        if (i==k)
            dist=sqrt((S(A(i)).X-sink.x)^2+(S(A(i)).Y-sink.y)^2);
            q=q+1;
            B(q)=A(i);
            C(q)=dist;
            %line ([S(A(i)).X sink.x],[S(A(i)).Y sink.y],'Color','r','LineStyle',':');
        else
            dist=sqrt((S(A(i)).X-S(A(i+1)).X)^2+(S(A(i)).Y-S(A(i+1)).Y)^2);
            line ([S(A(i)).X S(A(i+1)).X],[S(A(i)).Y S(A(i+1)).Y],'LineStyle',':');
            S(A(i)).E = S(A(i)).E-((ETX+EDA)*L + Eamp*L*(dist*dist));
        end
        
%         if i<k
%         S(A(i+1)).E = S(A(i+1)).E-(ERX*L);
%         end
        hold on;
    end
    
    
    % Third Chain
    A=0;
    k=1;
    for j=1+x2:x3
        if (S(j).E>0)
            A(k)=j;
            k=k+1;
        else
            dead=dead+1;
            plot(S(j).X,S(j).Y,'r.');
            hold on;
        end
    end
    k=k-1;
    for i=1:k
        if (S(A(i)).ENERGY==1)
            plot(S(A(i)).X,S(A(i)).Y,'r+');
        elseif (S(A(i)).ENERGY==2)
            plot(S(A(i)).X,S(A(i)).Y,'m^');
        else
            plot(S(A(i)).X,S(A(i)).Y,'bo');
        end
        if (i==k)
            dist=sqrt((S(A(i)).X-sink.x)^2+(S(A(i)).Y-sink.y)^2);
            q=q+1;
            B(q)=A(i);
            C(q)=dist;
            %line ([S(A(i)).X sink.x],[S(A(i)).Y sink.y],'Color','r','LineStyle',':');
        else
            dist=sqrt((S(A(i)).X-S(A(i+1)).X)^2+(S(A(i)).Y-S(A(i+1)).Y)^2);
            line ([S(A(i)).X S(A(i+1)).X],[S(A(i)).Y S(A(i+1)).Y],'LineStyle',':');
            S(A(i)).E = S(A(i)).E-((ETX+EDA)*L + Eamp*L*(dist*dist));
        end
        
%         if i<k
%         S(A(i+1)).E = S(A(i+1)).E-(ERX*L);
%         end
        hold on;
    end
    
    % Fourth Chain
    A=0;
    k=1;
    for j=1+x3:x4
        if (S(j).E>0)
            A(k)=j;
            k=k+1;
        else
            dead=dead+1;
            plot(S(j).X,S(j).Y,'r.');
            hold on;
        end
    end
    k=k-1;
    for i=1:k
        if (S(A(i)).ENERGY==1)
            plot(S(A(i)).X,S(A(i)).Y,'r+');
        elseif (S(A(i)).ENERGY==2)
            plot(S(A(i)).X,S(A(i)).Y,'m^');
        else
            plot(S(A(i)).X,S(A(i)).Y,'bo');
        end
        if (i==k)
            dist=sqrt((S(A(i)).X-sink.x)^2+(S(A(i)).Y-sink.y)^2);
            q=q+1;
            B(q)=A(i);
            C(q)=dist;
            %line ([S(A(i)).X sink.x],[S(A(i)).Y sink.y],'Color','r','LineStyle',':');
        else
            dist=sqrt((S(A(i)).X-S(A(i+1)).X)^2+(S(A(i)).Y-S(A(i+1)).Y)^2);
            line ([S(A(i)).X S(A(i+1)).X],[S(A(i)).Y S(A(i+1)).Y],'LineStyle',':');
            S(A(i)).E = S(A(i)).E-((ETX+EDA)*L + Eamp*L*(dist*dist)); 
        end
       
%         if i<k
%         S(A(i+1)).E = S(A(i+1)).E-(ERX*L);
%         end
        hold on;
    end
    
    % Fifth Chain
    A=0;
    k=1;
    for j=1+x4:x5
        if (S(j).E>0)
            A(k)=j;
            k=k+1;
        else
            dead=dead+1;
            plot(S(j).X,S(j).Y,'r.');
            hold on;
        end
    end
    k=k-1;
    for i=1:k
        if (S(A(i)).ENERGY==1)
            plot(S(A(i)).X,S(A(i)).Y,'r+');
        elseif (S(A(i)).ENERGY==2)
            plot(S(A(i)).X,S(A(i)).Y,'m^');
        else
            plot(S(A(i)).X,S(A(i)).Y,'bo');
        end
        if (i==k)
            dist=sqrt((S(A(i)).X-sink.x)^2+(S(A(i)).Y-sink.y)^2);
            q=q+1;
            B(q)=A(i);
            C(q)=dist;
            %line ([S(A(i)).X sink.x],[S(A(i)).Y sink.y],'Color','r','LineStyle',':');
        else
            dist=sqrt((S(A(i)).X-S(A(i+1)).X)^2+(S(A(i)).Y-S(A(i+1)).Y)^2);
            line ([S(A(i)).X S(A(i+1)).X],[S(A(i)).Y S(A(i+1)).Y],'LineStyle',':');
            S(A(i)).E = S(A(i)).E-((ETX+EDA)*L + Eamp*L*(dist*dist));
        end
        
%         if i<k
%         S(A(i+1)).E = S(A(i+1)).E-(ERX*L);
%         end
        hold on;
    end
    
    
    % Sixth Chain
    A=0;
    k=1;
    for j=1+x5:x6
        if (S(j).E>0)
            A(k)=j;
            k=k+1;
        else
            dead=dead+1;
            plot(S(j).X,S(j).Y,'r.');
            hold on;
        end
    end
    k=k-1;
    for i=1:k
        if (S(A(i)).ENERGY==1)
            plot(S(A(i)).X,S(A(i)).Y,'r+');
        elseif (S(A(i)).ENERGY==2)
            plot(S(A(i)).X,S(A(i)).Y,'m^');
        else
            plot(S(A(i)).X,S(A(i)).Y,'bo');
        end
        if (i==k)
            dist=sqrt((S(A(i)).X-sink.x)^2+(S(A(i)).Y-sink.y)^2);
            q=q+1;
            B(q)=A(i);
            C(q)=dist;
            %line ([S(A(i)).X sink.x],[S(A(i)).Y sink.y],'Color','r','LineStyle',':');
        else
            dist=sqrt((S(A(i)).X-S(A(i+1)).X)^2+(S(A(i)).Y-S(A(i+1)).Y)^2);
            line ([S(A(i)).X S(A(i+1)).X],[S(A(i)).Y S(A(i+1)).Y],'LineStyle',':');
            S(A(i)).E = S(A(i)).E-((ETX+EDA)*L + Eamp*L*(dist*dist));
        end
       
%         if i<k
%         S(A(i+1)).E = S(A(i+1)).E-(ERX*L);
%         end
        hold on;
    end
    
    
    % Seventh Chain
    A=0;
    k=1;
    for j=1+x6:x7
        if (S(j).E>0)
            A(k)=j;
            k=k+1;
        else
            dead=dead+1;
            plot(S(j).X,S(j).Y,'r.');
            hold on;
        end
    end
    k=k-1;
    for i=1:k
        if (S(A(i)).ENERGY==1)
            plot(S(A(i)).X,S(A(i)).Y,'r+');
        elseif (S(A(i)).ENERGY==2)
            plot(S(A(i)).X,S(A(i)).Y,'m^');
        else
            plot(S(A(i)).X,S(A(i)).Y,'bo');
        end
        if (i==k)
            dist=sqrt((S(A(i)).X-sink.x)^2+(S(A(i)).Y-sink.y)^2);
            q=q+1;
            B(q)=A(i);
            C(q)=dist;
            %line ([S(A(i)).X sink.x],[S(A(i)).Y sink.y],'Color','r','LineStyle',':');
        else
            dist=sqrt((S(A(i)).X-S(A(i+1)).X)^2+(S(A(i)).Y-S(A(i+1)).Y)^2);
            line ([S(A(i)).X S(A(i+1)).X],[S(A(i)).Y S(A(i+1)).Y],'LineStyle',':');
            S(A(i)).E = S(A(i)).E-((ETX+EDA)*L + Eamp*L*(dist*dist));
        end
        
%         if i<k
%         S(A(i+1)).E = S(A(i+1)).E-(ERX*L);
%         end
        hold on;
    end
    
    
    % Eighth Chain
    A=0;
    k=1;
    for j=1+x7:x8
        if (S(j).E>0)
            A(k)=j;
            k=k+1;
        else
            dead=dead+1;
            plot(S(j).X,S(j).Y,'r.');
            hold on;
        end
    end
    k=k-1;
    for i=1:k
        if (S(A(i)).ENERGY==1)
            plot(S(A(i)).X,S(A(i)).Y,'r+');
        elseif (S(A(i)).ENERGY==2)
            plot(S(A(i)).X,S(A(i)).Y,'m^');
        else
            plot(S(A(i)).X,S(A(i)).Y,'bo');
        end
        if (i==k)
            dist=sqrt((S(A(i)).X-sink.x)^2+(S(A(i)).Y-sink.y)^2);
            q=q+1;
            B(q)=A(i);
            C(q)=dist;
            %line ([S(A(i)).X sink.x],[S(A(i)).Y sink.y],'Color','r','LineStyle',':');
        else
            dist=sqrt((S(A(i)).X-S(A(i+1)).X)^2+(S(A(i)).Y-S(A(i+1)).Y)^2);
            line ([S(A(i)).X S(A(i+1)).X],[S(A(i)).Y S(A(i+1)).Y],'LineStyle',':');
            S(A(i)).E = S(A(i)).E-((ETX+EDA)*L + Eamp*L*(dist*dist));
        end
        
%         if i<k
%         S(A(i+1)).E = S(A(i+1)).E-(ERX*L);
%         end
        hold on;
    end
    
    
    % Ninth Chain
    A=0;
    k=1;
    for j=1+x8:x9
        if (S(j).E>0)
            A(k)=j;
            k=k+1;
        else
            dead=dead+1;
            plot(S(j).X,S(j).Y,'r.');
            hold on;
        end
    end
    k=k-1;
    for i=1:k
        if (S(A(i)).ENERGY==1)
            plot(S(A(i)).X,S(A(i)).Y,'r+');
        elseif (S(A(i)).ENERGY==2)
            plot(S(A(i)).X,S(A(i)).Y,'m^');
        else
            plot(S(A(i)).X,S(A(i)).Y,'bo');
        end
        if (i==k)
            dist=sqrt((S(A(i)).X-sink.x)^2+(S(A(i)).Y-sink.y)^2);
            q=q+1;
            B(q)=A(i);
            C(q)=dist;
            %line ([S(A(i)).X sink.x],[S(A(i)).Y sink.y],'Color','r','LineStyle',':');
        else
            dist=sqrt((S(A(i)).X-S(A(i+1)).X)^2+(S(A(i)).Y-S(A(i+1)).Y)^2);
            line ([S(A(i)).X S(A(i+1)).X],[S(A(i)).Y S(A(i+1)).Y],'LineStyle',':');
            S(A(i)).E = S(A(i)).E-((ETX+EDA)*L + Eamp*L*(dist*dist));
        end
        
%         if i<k
%         S(A(i+1)).E = S(A(i+1)).E-(ERX*L);
%         end
        hold on;
    end
    
    
    % Tenth Chain
    A=0;
    k=1;
    for j=1+x9:x10
        if (S(j).E>0)
            A(k)=j;
            k=k+1;
        else
            dead=dead+1;
            plot(S(j).X,S(j).Y,'r.');
            hold on;
        end
    end
    k=k-1;
    for i=1:k
        if (S(A(i)).ENERGY==1)
            plot(S(A(i)).X,S(A(i)).Y,'r+');
        elseif (S(A(i)).ENERGY==2)
            plot(S(A(i)).X,S(A(i)).Y,'m^');
        else
            plot(S(A(i)).X,S(A(i)).Y,'bo');
        end
        if (i==k)
            dist=sqrt((S(A(i)).X-sink.x)^2+(S(A(i)).Y-sink.y)^2);
            q=q+1;
            B(q)=A(i);
            C(q)=dist;
            %line ([S(A(i)).X sink.x],[S(A(i)).Y sink.y],'Color','r','LineStyle',':');
        else
            dist=sqrt((S(A(i)).X-S(A(i+1)).X)^2+(S(A(i)).Y-S(A(i+1)).Y)^2);
            line ([S(A(i)).X S(A(i+1)).X],[S(A(i)).Y S(A(i+1)).Y],'LineStyle',':');
            S(A(i)).E = S(A(i)).E-((ETX+EDA)*L + Eamp*L*(dist*dist));
        end
        
%         if i<k
%         S(A(i+1)).E = S(A(i+1)).E-(ERX*L);
%         end
        hold on;
    end
    if (H>q)
        H=1;
    end
   
    for i=1:q-1
        if (i<H)
            dist=sqrt((S(B(i)).X-S(B(i+1)).X)^2+(S(B(i)).Y-S(B(i+1)).Y)^2);
            line ([S(B(i)).X S(B(i+1)).X],[S(B(i)).Y S(B(i+1)).Y],'LineStyle','-','color','r');
            S(B(i)).E = S(B(i)).E-((ETX+EDA)*L + Eamp*L*(dist*dist));
        else
            dist=sqrt((S(B(i)).X-S(B(i+1)).X)^2+(S(B(i)).Y-S(B(i+1)).Y)^2);
            line ([S(B(i)).X S(B(i+1)).X],[S(B(i)).Y S(B(i+1)).Y],'LineStyle','-','color','r');
            S(B(i+1)).E = S(B(i+1)).E-((ETX+EDA)*L + Eamp*L*(dist*dist));
        end
    end
    if (B(H)~=0)
    S(B(H)).E = S(B(H)).E-((ETX+EDA)*L + Eamp*L*(C(H)*C(H)));
    line ([S(B(H)).X sink.x],[S(B(H)).Y sink.y],'LineStyle','-','color','k');
    end
    H=H+1;
    
  DEAD(r)=dead;
  ALIVE(r)=n-dead;
  
  if (flag==0 && dead==1)
      first_dead=r;
      flag=1;
  end
  if (flag_20==0 && dead==20)
      dead_20=r;
      flag_20=1;
  end
  if (flag_50==0 && dead==50)
      dead_50=r;
      flag_50=1;
  end
  if dead==n
      break;
  end
end

for i=1:1:r
    x(i)=i;
end

figure(2);
hold on;
plot(x,ALIVE,'r');
hold on;
title ('ALIVE NODES vs ROUNDS');
xlabel ('number of rounds');
ylabel ('number of alive nodes');
figure(3);
hold on;
plot(x,DEAD,'r');
hold on;
xlabel ('number of rounds');
ylabel ('number of dead nodes');
title ('DEAD NODES vs ROUNDS');

