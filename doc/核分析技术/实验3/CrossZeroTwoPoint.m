function temp=CrossZeroTwoPoint(inpu_data)
    total=length(inpu_data(:,2));
    temp=zeros(total,2);
    for i=1:total-1
        if (abs(inpu_data(i,2)+inpu_data(i+1,2))<(abs(inpu_data(i,2))+abs(inpu_data(i+1,2))))
               temp(i,1)=inpu_data(i,1);
               temp(i,2)=inpu_data(i,2);
               temp(i+1,1)=inpu_data(i+1,1);
               temp(i+1,2)=inpu_data(i+1,2);
        end
    end
end