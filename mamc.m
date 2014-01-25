clear;
clc;
noOfNodes = 100;
L = 100;
j=1;
R = 100; % maximum range;
netXloc = rand(1,noOfNodes)*L;
netYloc = rand(1,noOfNodes)*L;
netloc=[netXloc;netYloc];
loc_sort=(sortrows(netloc'))';
netXloc=loc_sort(1,1:50);
netYloc=loc_sort(2,1:50);
netloc1=[netXloc;netYloc];
l=1;
%range 0-10
for i=1:100
        if (loc_sort(1,i)>=0 && loc_sort(1,i)<=10)
           range1(1:2,l)=loc_sort(1:2,i);
           l=l+1;
        end
end

l=1;  
%range 10-20
for i=1:100
        if (loc_sort(1,i)>=10 && loc_sort(1,i)<=20)
           range2(1:2,l)=loc_sort(1:2,i);
           l=l+1;
        end
end

l=1; 
%range 20-30
for i=1:100
        if (loc_sort(1,i)>=20 && loc_sort(1,i)<=30)
           range3(1:2,l)=loc_sort(1:2,i);
           l=l+1;
        end
end

l=1; 
%range 30-40
for i=1:100
        if (loc_sort(1,i)>=30 && loc_sort(1,i)<=40)
           range4(1:2,l)=loc_sort(1:2,i);
           l=l+1;
        end
end

l=1; 
%range 40-50
for i=1:100
        if (loc_sort(1,i)>=40 && loc_sort(1,i)<=50)
           range5(1:2,l)=loc_sort(1:2,i);
           l=l+1;
        end
end

l=1; 
%range 50-60
for i=1:100
        if (loc_sort(1,i)>=50 && loc_sort(1,i)<=60)
           range6(1:2,l)=loc_sort(1:2,i);
           l=l+1;
        end
end

l=1; 
%range 60-70
for i=1:100
        if (loc_sort(1,i)>=60 && loc_sort(1,i)<=70)
           range7(1:2,l)=loc_sort(1:2,i);
           l=l+1;
        end
end

l=1; 
%range 70-80
for i=1:100
        if (loc_sort(1,i)>=70 && loc_sort(1,i)<=80)
           range8(1:2,l)=loc_sort(1:2,i);
           l=l+1;
        end
end

l=1; 
%range 80-90
for i=1:100
        if (loc_sort(1,i)>=80 && loc_sort(1,i)<=90)
           range9(1:2,l)=loc_sort(1:2,i);
           l=l+1;
        end
end

l=1; 
%range 90-100
for i=1:100
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


Efs=10*0.000000000001;
Emp=0.0013*0.000000000001;
do=sqrt(Efs/Emp);
ctrPacketLength = 200;
packetlength=6400;
ETX=50*0.000000001;

%range 0-10

l1=length(range1);
for i=1:l1
    S1(i).X=range1(1,i);
    S1(i).Y=range1(2,i);
    S1(i).E=0.5;
end

for i=1:l1-1
    figure(1);
    plot(S1(i).X,S1(i).Y,'ro');
    hold on;
    grid on;
    dist=sqrt((S1(i).X-S1(i+1).X)^2+(S1(i).Y-S1(i+1).Y)^2);
    line ([S1(i).X S1(i+1).X],[S1(i).Y S1(i+1).Y],'LineStyle','-');
    hold on;
    if (dist>do)
        S1(i).E=S1(i).E-(ETX*ctrPacketLength + Emp*ctrPacketLength*(dist*dist*dist*dist));
    else
        S1(i).E = S1(i).E-(ETX*ctrPacketLength + Efs*ctrPacketLength*(dist*dist));
    end
end

%range 10-20

l2=length(range2);
for i=1:l2
    S2(i).X=range2(1,i);
    S2(i).Y=range2(2,i);
    S2(i).E=0.5;
end

for i=1:l2-1
    figure(1);
    plot(S2(i).X,S2(i).Y,'ro');
    hold on;
    grid on;
    dist=sqrt((S2(i).X-S2(i+1).X)^2+(S2(i).Y-S2(i+1).Y)^2);
    line ([S2(i).X S2(i+1).X],[S2(i).Y S2(i+1).Y],'LineStyle','-');
    hold on;
    if (dist>do)
        S2(i).E=S2(i).E-(ETX*ctrPacketLength + Emp*ctrPacketLength*(dist*dist*dist*dist));
    else
        S2(i).E = S2(i).E-(ETX*ctrPacketLength + Efs*ctrPacketLength*(dist*dist));
    end
end


%range 20-30

l3=length(range3);
for i=1:l3
    S3(i).X=range3(1,i);
    S3(i).Y=range3(2,i);
    S3(i).E=0.5;
end

for i=1:l3-1
    figure(1);
    plot(S3(i).X,S3(i).Y,'ro');
    hold on;
    grid on;
    dist=sqrt((S3(i).X-S3(i+1).X)^2+(S3(i).Y-S3(i+1).Y)^2);
    line ([S3(i).X S3(i+1).X],[S3(i).Y S3(i+1).Y],'LineStyle','-');
    hold on;
    if (dist>do)
        S3(i).E=S3(i).E-(ETX*ctrPacketLength + Emp*ctrPacketLength*(dist*dist*dist*dist));
    else
        S3(i).E = S3(i).E-(ETX*ctrPacketLength + Efs*ctrPacketLength*(dist*dist));
    end
end

%range 30-40

l4=length(range4);
for i=1:l4
    S4(i).X=range4(1,i);
    S4(i).Y=range4(2,i);
    S4(i).E=0.5;
end

for i=1:l4-1
    figure(1);
    plot(S4(i).X,S4(i).Y,'ro');
    hold on;
    grid on;
    dist=sqrt((S4(i).X-S4(i+1).X)^2+(S4(i).Y-S4(i+1).Y)^2);
    line ([S4(i).X S4(i+1).X],[S4(i).Y S4(i+1).Y],'LineStyle','-');
    hold on;
    if (dist>do)
        S4(i).E=S4(i).E-(ETX*ctrPacketLength + Emp*ctrPacketLength*(dist*dist*dist*dist));
    else
        S4(i).E = S4(i).E-(ETX*ctrPacketLength + Efs*ctrPacketLength*(dist*dist));
    end
end

%range 40-50

l5=length(range5);
for i=1:l5
    S5(i).X=range5(1,i);
    S5(i).Y=range5(2,i);
    S5(i).E=0.5;
end

for i=1:l5-1
    figure(1);
    plot(S5(i).X,S5(i).Y,'ro');
    hold on;
    grid on;
    dist=sqrt((S5(i).X-S5(i+1).X)^2+(S5(i).Y-S5(i+1).Y)^2);
    line ([S5(i).X S5(i+1).X],[S5(i).Y S5(i+1).Y],'LineStyle','-');
    hold on;
    if (dist>do)
        S5(i).E=S5(i).E-(ETX*ctrPacketLength + Emp*ctrPacketLength*(dist*dist*dist*dist));
    else
        S5(i).E = S5(i).E-(ETX*ctrPacketLength + Efs*ctrPacketLength*(dist*dist));
    end
end


%range 50-60

l6=length(range6);
for i=1:l6
    S6(i).X=range6(1,i);
    S6(i).Y=range6(2,i);
    S6(i).E=0.5;
end

for i=1:l6-1
    figure(1);
    plot(S6(i).X,S6(i).Y,'ro');
    hold on;
    grid on;
    dist=sqrt((S6(i).X-S6(i+1).X)^2+(S6(i).Y-S6(i+1).Y)^2);
    line ([S6(i).X S6(i+1).X],[S6(i).Y S6(i+1).Y],'LineStyle','-');
    hold on;
    if (dist>do)
        S6(i).E=S6(i).E-(ETX*ctrPacketLength + Emp*ctrPacketLength*(dist*dist*dist*dist));
    else
        S6(i).E = S6(i).E-(ETX*ctrPacketLength + Efs*ctrPacketLength*(dist*dist));
    end
end

%range 60-70

l7=length(range7);
for i=1:l7
    S7(i).X=range7(1,i);
    S7(i).Y=range7(2,i);
    S7(i).E=0.5;
end

for i=1:l7-1
    figure(1);
    plot(S7(i).X,S7(i).Y,'ro');
    hold on;
    grid on;
    dist=sqrt((S7(i).X-S7(i+1).X)^2+(S7(i).Y-S7(i+1).Y)^2);
    line ([S7(i).X S7(i+1).X],[S7(i).Y S7(i+1).Y],'LineStyle','-');
    hold on;
    if (dist>do)
        S7(i).E=S7(i).E-(ETX*ctrPacketLength + Emp*ctrPacketLength*(dist*dist*dist*dist));
    else
        S7(i).E = S7(i).E-(ETX*ctrPacketLength + Efs*ctrPacketLength*(dist*dist));
    end
end

%range 70-80

l8=length(range8);
for i=1:l8
    S8(i).X=range8(1,i);
    S8(i).Y=range8(2,i);
    S8(i).E=0.5;
end

for i=1:l8-1
    figure(1);
    plot(S8(i).X,S8(i).Y,'ro');
    hold on;
    grid on;
    dist=sqrt((S8(i).X-S8(i+1).X)^2+(S8(i).Y-S8(i+1).Y)^2);
    line ([S8(i).X S8(i+1).X],[S8(i).Y S8(i+1).Y],'LineStyle','-');
    hold on;
    if (dist>do)
        S8(i).E=S8(i).E-(ETX*ctrPacketLength + Emp*ctrPacketLength*(dist*dist*dist*dist));
    else
        S8(i).E = S8(i).E-(ETX*ctrPacketLength + Efs*ctrPacketLength*(dist*dist));
    end
end

%range 80-90

l9=length(range9);
for i=1:l9
    S9(i).X=range9(1,i);
    S9(i).Y=range9(2,i);
    S9(i).E=0.5;
end

for i=1:l9-1
    figure(1);
    plot(S9(i).X,S9(i).Y,'ro');
    hold on;
    grid on;
    dist=sqrt((S9(i).X-S9(i+1).X)^2+(S9(i).Y-S9(i+1).Y)^2);
    line ([S9(i).X S9(i+1).X],[S9(i).Y S9(i+1).Y],'LineStyle','-');
    hold on;
    if (dist>do)
        S9(i).E=S9(i).E-(ETX*ctrPacketLength + Emp*ctrPacketLength*(dist*dist*dist*dist));
    else
        S9(i).E = S9(i).E-(ETX*ctrPacketLength + Efs*ctrPacketLength*(dist*dist));
    end
end

%range 90-100

l10=length(range10);
for i=1:l10
    S10(i).X=range10(1,i);
    S10(i).Y=range10(2,i);
    S10(i).E=0.5;
end

for i=1:l10-1
    figure(1);
    plot(S10(i).X,S10(i).Y,'ro');
    hold on;
    grid on;
    dist=sqrt((S10(i).X-S10(i+1).X)^2+(S10(i).Y-S10(i+1).Y)^2);
    line ([S10(i).X S10(i+1).X],[S10(i).Y S10(i+1).Y],'LineStyle','-');
    hold on;
    if (dist>do)
        S10(i).E=S10(i).E-(ETX*ctrPacketLength + Emp*ctrPacketLength*(dist*dist*dist*dist));
    else
        S10(i).E = S10(i).E-(ETX*ctrPacketLength + Efs*ctrPacketLength*(dist*dist));
    end
end




