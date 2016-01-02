function temp=FivePointSmooth_G(input_data)
    total=length(input_data(:,2));
    for i=3:total-2
        temp(i-2,2)=(input_data(i-2,1)+4*input_data(i-1,2)+6*input_data(i,2)+4*input_data(i+1,2)+input_data(i+2,2))/16;
        temp(i-2,1)=input_data(i);
    end
end