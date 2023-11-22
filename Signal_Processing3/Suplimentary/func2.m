function func2 = x(t)
func2 = zeros(1,length(t));
  for i = 1:length(t) 
    if(t(i)<-2)&&(t(i)>2)
        func2(i)=0;
    end
    if(t(i)>=-2)&&(t(i)<-1)
        func2(i)=1;
    end
    if(t(i)>=-1)&&(t(i)<1)
        func2(i)=-1;
    end
    if(t(i)>=1)&&(t(i)<=2)
        func2(i)=1;
    end
  end
end