function func = x(t)
func = zeros(1,length(t));
  for i = 1:length(t) 
    if (t(i) > 0) && (t(i)< 3 )
    func(i) = 9-(t(i)-3)*(t(i)-3);
    end
  end
end

