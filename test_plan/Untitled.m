% clc
% clear

% 需要变量 data_other segment ,0.1,1  start_id end_id
addpath('../code')

id = start_id:end_id;
select_id = zeros(1,length(id));
for i = id
    if i-5<=0
        st = 1; en = 11;
    elseif i+5>end_id
        st = end_id-10; en = end_id;
    else
        st = i-5;en = i+5;
    end
    [his_seg,h_limit]= build_his2(data_other,segment.segment_start_time(st),segment.segment_end_time(en) ,0.1,1);
    [limit] = find_boundary(his_seg,h_limit);
    if ~isnan(limit)
        flag = (data_other.delta_time>=segment.segment_start_time(i))&(data_other.delta_time<=segment.segment_end_time(i))...
            &(data_other.height>=limit(1))&(data_other.height<=limit(2));
        id_temp = data_other.id(flag);
        select_id(1:length(id_temp),i) = id_temp;
    end
    
end
select_id = select_id(:);
select_id(select_id==0) = [];