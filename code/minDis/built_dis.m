function [z] = built_dis(data)
%UNTITLED5 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
% ��ȡ����
x = [data.dis,double(data.height)];
d = pdist(x);
z = squareform(d);
end