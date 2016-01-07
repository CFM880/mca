function temp=FindMax(input_data)
    i=(find(input_data(:,2)==max(input_data(:,2))));
    temp(1,1)=input_data(i,1);
    temp(1,2)=input_data(i,2);
    
end