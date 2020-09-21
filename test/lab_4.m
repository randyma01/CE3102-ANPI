function [diff_f] = lab_4(f)
    func = str2func(f);
    %diff_f = func(2);
    diff_f= diff(func);
end

[diff_f]=lab_4('@(x)-x-2')
