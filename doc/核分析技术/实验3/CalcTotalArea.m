function temp=CalcTotalArea(begin_x,end_x,input_data)
    real_begin_x=begin_x-input_data(1,1)+1;
    real_end_x=end_x-input_data(1,1)+1;
    temp=0;
    for i=real_begin_x:real_end_x-1
        temp = temp + (input_data(i,2)+input_data(i+1,2))/2; 
    end
end

