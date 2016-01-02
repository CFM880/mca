function temp=F5Max(input_data)
    total=length(input_data(:,2));
    temp=zeros(total,2);
    for i=3:total-2
        if ((input_data(i,2)-sqrt(input_data(i,2)))>input_data(i-2,2))&&((input_data(i,2)-sqrt(input_data(i,2)))>input_data(i+2,2))
               temp(i,1)=input_data(i,1);
               temp(i,2)=input_data(i,2);
        end
    end
end