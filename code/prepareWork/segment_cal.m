function [segment_start_time, segment_end_time] = segment_cal(segment)
%UNTITLED4 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
time = segment.delta_time;
num = length(time);
time1 = time(1:num-1);
time2 = time(2:num);

time_node = (time1+time2)/2;
time_first = time1(1) - (time_node(1) - time1(1));
time_end = time(num) + (time(end) - time_node(end));

segment_start_time = [time_first;time_node];
segment_end_time = [time_node;time_end];

end

