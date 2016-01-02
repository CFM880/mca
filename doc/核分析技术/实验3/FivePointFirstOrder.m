function temp=FivePointFirstOrder(input_data)
    total=length(input_data(:,2));

    for i=3:total-2
        temp(i-2,2)=(input_data(i-2,2)-8*input_data(i-1,2)+8*input_data(i+1,2)-input_data(i+2,2))/12;
        temp(i-2,1)=input_data(i,1);
    end
end

