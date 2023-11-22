%Boeru Elena-Briana, 421G
function y=f(t)
% Returns the function
y = zeros(1,length(t));
% In Matlab bits are used to show numbers and this results in the fact that sometimes the values for the numbers are not so exact. For example
% even if we see a whole value (like 1 for example), in reality it might be
% equal to 0.999999999999etc. Because of this we need to use a threshold value to take into consideration these errors.
thr = 0.00001;
for i=1:length(t)
        if (t(i) - thr >-5) && (t(i) + thr < -1)
            y(i) = -t(i)^2 - 6*t(i) - 6;
        end
end