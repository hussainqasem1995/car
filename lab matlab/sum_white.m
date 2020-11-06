function [white,count]=sum_white(area)
[a,b]=size(area);
white=0;
count=0;
for x=1:a
    for y=1:b
        count=count+1;
        if area(x,y)==1
            white=white+1;
        end
    end
end