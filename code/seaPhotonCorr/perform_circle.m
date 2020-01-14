% function [outputArg1,outputArg2] = perform_circle(data,data_sea_surface,data_under,segment,num_seg,start_id,end_id)
function  perform_circle(data,data_sea_surface,data_under,segment,num_seg,start_id,end_id)
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
for i = start_id:end_id
    if i-num_seg<start_id
        st_id = start_id;
        en_id = start_id + num_seg*2;
    elseif i+num_seg>end_id
        st_id = start_id-num_seg*2;
        en_id = end_id;
    else
        st_id = i - num_seg;
        en_id = i + num_seg;
    end
    start_time = segment.segment_start_time(st_id);
    end_time = segment.segment_end_time(en_id);
    flag1 = (data_sea_surface.delta_time >= start_time)&(data_sea_surface.delta_time <= end_time);
    p = polyfit(data_sea_surface.dis(flag1),data_sea_surface.height(flag1),1);
    f = @(x) p(1)*x+p(2);
    y = f(data_sea_surface.dis(flag1));
    dif_line = y - data_sea_surface.height(flag1);
    t = std(dif_line);

    
end

end

