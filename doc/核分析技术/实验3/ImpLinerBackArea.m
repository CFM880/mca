function temp=ImpLinerBackArea(begin_x,end_x,left,right,input_data)
    real_begin_x=begin_x-input_data(1,1)+1;
    real_end_x=end_x-input_data(1,1)+1;
    left_begin=real_begin_x-left;
    right_end=real_end_x+right;
    temp=0.5*(mean(input_data(left_begin:real_begin_x,2))+mean(input_data(real_end_x:right_end,2)))/(end_x-begin_x+1);
 end