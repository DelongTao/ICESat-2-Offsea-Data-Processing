function [outputArg1,outputArg2] = outlier_check(data_sea_surface,segment,start_id,end_id)
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

% id_temp = zeros(1,end_id-start_id+1);
ave_sea_surface = zeros(end_id-start_id+1,1);
k = 0;
for i = start_id:end_id
    k = k+1;
    flag1 = (data_sea_surface.delta_time >= segment.segment_start_time(i))...
        &(data_sea_surface.delta_time <= segment.segment_end_time(i));
    temp_height = data_sea_surface.height(flag1);
    ave_sea_surface(k) = mean(temp_height);    
end

ave_sea_sur_mean = nanmean(ave_sea_surface);
ave_sea_std = nanstd(ave_sea_surface);

flag2 = (ave_sea_surface<=(ave_sea_sur_mean-3*ave_sea_std))|(ave_sea_surface>=(ave_sea_sur_mean+3*ave_sea_std));







end

