function score=taskputrand2(line,core,m,gibt)
box=zeros(1,core);
if(m>=core)
for i=1:core
box(i)=box(i)+gibt(line(i));
end
for i=core+1:m
    [~,place]=min(box);
    box(place)=box(place)+gibt(line(i));
end
else
for i=1:m
box(i)=box(i)+gibt(line(i));
end
end
score=max(box);
end