function temp=F5Max(input_x,input_y)
    total=length(input_y);
    temp=zeros(total,2);
    for i=3:total-2
        if ((input_y(i)-sqrt(input_y(i)))>input_y(i-2))&&((input_y(i)-sqrt(input_y(i)))>input_y(i+2))
               temp(i,1)=input_x(i);
               temp(i,2)=input_y(i);
        end
    end
end