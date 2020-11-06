function sum_arae=sum_value(area)
[a,b]=size(area);
white=0;
black=0;
for x=1:a
    for y=1:b
        if area(x,y)==0
            black=black+1;
        end
        if area(x,y)==1
            white=white+1;
        end
    end
end
if white > black
   sum_arae=1;
else 
  sum_arae=0;

end
end