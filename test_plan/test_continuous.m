function [start,end1] = test_continuous(X)
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

num = length(X);
start = [];
end1 = [];

if X(1)==1
    start = [start;1];
end
for i = 1:num-1
    if X(i)==0&&X(i+1)==1
        start = [start;i+1];
    elseif X(i)==1&&X(i+1)==0
        end1 = [end1;i];
    end
end
if X(num)==1
    end1 = [end1;num];
end

end

