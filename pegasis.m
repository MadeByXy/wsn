%pegasis·¨
clc
clear
energy=zeros(1,100);
receive_factor=512*50*0.0001;
 send_factor=512*12*0.001;
 
no=100;
node_x=rand(1,no);
node_y=rand(1,no);
figure(2);
plot(node_x,node_y,'.')
hold on 
%plot(node_x(1),node_y(1),'.r')
hold on
%plot([node_x(1) 0],[node_y(1) 0])
hold on

p=0.15;n=fix(1/p);
for round=1:n
    
distance=zeros(1);
max_distance=0;
max_node=0;
for i=1:no,
    distance(i)=sqrt(node_x(i)^2+node_y(i)^2);
    if max_distance<distance(i),
        max_distance=distance(i);
        max_node=i;
    end
end
plot(node_x(max_node),node_y(max_node),'.')
average_distance=sum(distance(:))/no;

connect_distance=zeros(1,no);
connect_node=zeros(1,no);
connect_node(1)=max_node;
connect_distance(1)=average_distance;

for i=2:no,
    temp_node=0;
    temp_min_distance=1.5;
    for j=1:no,
        b=0;
        for k=1:(i-1),
            if j==connect_node(k),
               b=1;
               break
            end
        end
        if b==0,
           distance=sqrt((node_x(connect_node(i-1))-node_x(j))^2+(node_y(connect_node(i-1))-node_y(j))^2);
           if temp_min_distance>distance,
              temp_min_distance=distance;
              temp_node=j;
          end
        end
   end
    connect_distance(i)=temp_min_distance;
    connect_node(i)=temp_node;
    plot([node_x(connect_node(i-1)) node_x(connect_node(i))],[node_y(connect_node(i-1)) node_y(connect_node(i))],'-');
    hold on 
    energy(connect_node(i-1))=energy(connect_node(i-1))+connect_distance(i)^2*send_factor+receive_factor;
    energy(connect_node(i))=energy(connect_node(i))+receive_factor;
end

t=fix(rand(rand(1,1))*100)+1;
energy(t)=energy(t)+average_distance^2*send_factor+receive_factor;

end

receive_factor=512*50*0.0001;
receive_consumption=100*receive_factor;
energy_consumption=zeros(1,no);
send_factor=512*12*0.001;

for i=1:no,
    energy_consumption(i)=connect_distance(i)^2*send_factor+receive_factor;
end
consumption=receive_consumption+sum(energy_consumption(:))

figure();
plot(1:100,energy,'.')
hold on
