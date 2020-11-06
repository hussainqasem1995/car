function sum=sum_(area)
[a,b]=size(area);
sum=0;
for x=1:a
    for y=1:b
         sum=sum+area(x,y);   
    end
end

