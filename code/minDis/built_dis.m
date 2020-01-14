function [z] = built_dis(data)
%UNTITLED5 此处显示有关此函数的摘要
%   此处显示详细说明
% 求取距离
x = [data.dis,double(data.height)];
d = pdist(x);
z = squareform(d);
end