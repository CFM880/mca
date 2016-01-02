function temp=GaussArea(begin_x,end_x,h,input_data)
    real_begin_x=begin_x-input_data(1,1)+1;
    real_end_x=end_x-input_data(1,1)+1;
    temp=sqrt(2*pi)*std(input_data(real_begin_x:real_end_x,2))*h
 end