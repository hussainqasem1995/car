function [black,count]=sum_black(area)
[a,b]=size(area);
black=0;
count=0;
for x=1:a
    for y=1:b
        count=count+1;
        if area(x,y)==0
            black=black+1;
        end
    end
end