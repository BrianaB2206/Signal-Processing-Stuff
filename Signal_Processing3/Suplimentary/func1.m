function func1 = x(t)
func1 = zeros(1,length(t));
  for i = 1:length(t) 
    func1(i) = exp(-pi*t(i)^2)*sin(20*pi*t(i));
    end
end