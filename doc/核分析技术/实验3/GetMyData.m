function temp=GetMyData(core_point,data_width,input_data)
    total=data_width+1;
    temp=zeros(total,2);
    temp(:,1)=input_data((core_point-data_width/2:core_point+data_width/2),1);
    temp(:,2)=input_data((core_point-data_width/2:core_point+data_width/2),2);
end