%GIWAXS plot aggregator

foo = dir('MAPLE2*');

for i = 1:8
    ann(i) = imread(foo(i).name);
end

for i = 9:16
    noAnn(i).img = imread(foo(i).name);
end