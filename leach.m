clear;
%Field Dimensions - x and y maximum (in meters)
xm = 100;
ym = 100;
sink.x=50;
sink.y=300;
%Number of Nodes in the field
n = 100;
%Optimal Election Probability of a node to become cluster head
p=0.05;
packetLength =2000; 

%Energy values in Joules
%Initial Energy 
Eo = 1;
%Eelec=Etx=Erx
ETX=50*0.000000001;
ERX=50*0.000000001;
%Transmit Amplifier types
Efs=10*0.000000000001;
Emp=10*0.000000000001;
%Data Aggregation Energy
EDA=5*0.000000001;

INFINITY = 999999999999999;
%maximum number of rounds
rmax=5000;


%Computation of do
do=sqrt(Efs/Emp);
figure (1);
%Creation of the random Sensor Network
for i=1:1:n
    S(i).xd=rand(1,1)*xm; %random x coordinates 
    XR(i)=S(i).xd; %assign it to XR vector
    S(i).yd=rand(1,1)*ym; %random y coordinates
    YR(i)=S(i).yd; %assign it to YR vector
    S(i).G=0;
    plot(S(i).xd,S(i).yd,'o');
    %initially there are no cluster heads only nodes
    S(i).type='N'; %N denotes "Not a Clusterhead" while C denotes "Clusterhead"  
    S(i).E=Eo; %all nodes have initial energy Eo=0.5J
    S(i).ENERGY=0;
    hold on;
end
% The 101st node is the sink
S(n+1).xd=sink.x;
S(n+1).yd=sink.y;
            
%First Iteration
figure(1);
%counter for CHs
countCHs=0;
%counter for CHs per round
rcountCHs=0;
cluster=1;

countCHs;
rcountCHs=rcountCHs+countCHs;
flag_first_dead=0; 

for r=1:1:rmax %?,ÿ1
  r
  %Operation for epoch
  if(mod(r, round(1/p))==0)
     for i=1:1:n
        S(i).G=0;
        S(i).cl=0;
     end
  end

hold off;

%Number of dead nodes
dead=0;

%counter for bit transmitted to Bases Station and to Cluster Heads
packets_TO_BS=0;
packets_TO_CH=0;
%counter for bit transmitted to Bases Station and to Cluster Heads per round
PACKETS_TO_CH(r)=0;
PACKETS_TO_BS(r)=0;
figure(1);

for i=1:1:n
    %checking if there is a dead node
     if (S(i).E<=0)
         plot(S(i).xd,S(i).yd,'red .');
       dead=dead+1;    %if energy is less than 0 then the node is dead.
       hold on;
     end
     if (S(i).E>0)    
        plot(S(i).xd,S(i).yd,'o'); 
        S(i).type='N'; %if energy is more than 0 then it is not a clusterhead
        hold on;
     end
end
plot(S(n+1).xd,S(n+1).yd,'x');

% if (dead == n)    %if no. of dead nodes is equal to total no. of nodes then the whole network is dead.
%    break;
% end

STATISTICS(r).DEAD=dead;
DEAD(r)=dead;

%When the first node dies
if (dead==1)
    if(flag_first_dead==0)
        first_dead=r;
        flag_first_dead=1;
    end
end

countCHs=0;
cluster=1;
for i=1:1:n
   if(S(i).E>0)
     temp_rand=rand;     
     if ((S(i).G)<=0) %ý???
        %Election of Cluster Heads
        if(temp_rand <=(p/(1-p*mod(r,round(1/p)))))
            countCHs = countCHs+1;
            
            S(i).type = 'C';
            S(i).G = round(1/p)-1;
            C(cluster).xd = S(i).xd; % C is a vector storing details of all the clusterheads
            C(cluster).yd = S(i).yd;
            plot(S(i).xd,S(i).yd,'k*');
            distance=sqrt((S(i).xd-(S(n+1).xd))^2 + (S(i).yd-(S(n+1).yd))^2);%sink?
            
            C(cluster).distance = distance;
            C(cluster).id = i;
            X(cluster)=S(i).xd;
            Y(cluster)=S(i).yd;
            cluster=cluster+1;
            %Calculation of Energy dissipated
            distance;
            if(distance>=do)
                 S(i).E = S(i).E-((ETX+EDA)*packetLength+ Emp*packetLength*(distance*distance));
            else
                 S(i).E = S(i).E-((ETX+EDA)*packetLength+ Efs*packetLength*(distance*distance)); 
            end
            packets_TO_BS = packets_TO_BS+1;
            PACKETS_TO_BS(r) = packets_TO_BS;
        end     
     end
   end 
end

STATISTICS(r).CLUSTERHEADS = cluster-1;%??r???,r?0?,?1;cluster?-1,?1
CLUSTERHS(r)= cluster-1;

%Election of Associated Cluster Head for Normal Nodes
for i=1:1:n
   if (S(i).type=='N' && S(i).E>0) %??
    % min_dis = sqrt( (S(i).xd-S(n+1).xd)^2 + (S(i).yd-S(n+1).yd)^2 );%???sink?
     min_dis = INFINITY; 
     if(cluster-1>=1)%??
         min_dis_cluster = 1;
         %??
         for c = 1:1:cluster-1 %??cluster-1
            %temp = min(min_dis,sqrt( (S(i).xd - C(c).xd)^2 + (S(i).yd - C(c).yd)^2 ) );
            temp = sqrt((S(i).xd - C(c).xd)^2 + (S(i).yd - C(c).yd)^2);
            if (temp<min_dis)
                min_dis = temp;
                min_dis_cluster = c;
            end
            %????
           
         end
       
         %Energy dissipated by associated Cluster Head?????,??
         min_dis;
         if (min_dis > do)
            
             S(i).E = S(i).E - (ETX*(packetLength) + Emp*packetLength*( min_dis * min_dis)); %??
         else
           
            S(i).E = S(i).E -(ETX*(packetLength) + Efs*packetLength*( min_dis * min_dis)); %??
         end
         
             
         %Energy dissipated %?????,??????
         if(min_dis > 0)
            S(C(min_dis_cluster).id).E = S(C(min_dis_cluster).id).E - ((ERX + EDA)*packetLength ); %????
           
           
           PACKETS_TO_CH(r) = n - dead - cluster + 1; %??????
         end
       
         S(i).min_dis = min_dis;
         S(i).min_dis_cluster = min_dis_cluster;
     
     end
  end
end
%hold on;

countCHs;
rcountCHs = rcountCHs + countCHs;
if dead==n
    break;
end
end

x=1:1:r;
y=1:1:r;
%z=1:1:r;

for i=1:1:r;
    x(i)=i;
    y(i) = n - STATISTICS(i).DEAD;
    %z(i)=CLUSTERHS(i);
end
%plot(x,y,'r',x,z,'b');
figure(2);
plot(x,y,'r');
hold on;
title ('ALIVE NODES vs ROUNDS');
xlabel ('number of rounds');
ylabel ('number of alive nodes');
hold on;
figure(3);
hold on;
plot(x,DEAD,'r');
hold on;
xlabel ('number of rounds');
ylabel ('number of dead nodes');
title ('DEAD NODES vs ROUNDS');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   STATISTICS    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                                     %
%  DEAD  : a rmax x 1 array of number of dead nodes/round 
%  DEAD_A : a rmax x 1 array of number of dead Advanced nodes/round
%  DEAD_N : a rmax x 1 array of number of dead Normal nodes/round
%  CLUSTERHS : a rmax x 1 array of number of Cluster Heads/round
%  PACKETS_TO_BS : a rmax x 1 array of number packets send to Base Station/round
%  PACKETS_TO_CH : a rmax x 1 array of number of packets send to ClusterHeads/round
%  first_dead: the round where the first node died                   
%                                                                                     %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%??sink(50,175) ,ctrPacketLength=200,packetLength=4000,Eo=2J.