function [h_limit_sea] = sea_photon_limit(water_loc,sig_thickness,data_selected,start_time,end_time,height_centre_bou,semi_limit)
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
[his_seg,h_limit] = build_his2(data_selected,start_time,end_time,height_centre_bou,semi_limit);
start_water_limit_lower = water_loc - sig_thickness;
end_water_limit_lower = water_loc + sig_thickness;

[his_seg_new,h_limit_new] = limit_bins(his_seg,h_limit,start_water_limit_lower,end_water_limit_lower);

[~,id] = max(his_seg_new);
h_cen_sea = sum(h_limit_new(id,:))/2;
% h_limit_sea(1) = min([h_cen_sea,water_loc]) -  sig_thickness/2;
% h_limit_sea(2) = max([h_cen_sea,water_loc]) +  sig_thickness/2;
h_limit_sea(1) = h_cen_sea -  sig_thickness/2;
h_limit_sea(2) = h_cen_sea +  sig_thickness/2;
end

function [his_seg_new,h_limit_new] = limit_bins(his_seg,h_limit,start_water_limit_lower,end_water_limit_lower)
a = abs(start_water_limit_lower - h_limit);
[~,start_id] = min(a);
start_id = start_id - 1;
b = abs(end_water_limit_lower - h_limit);
[~,end_id] = min(b);
end_id = end_id + 1;
his_seg_new = his_seg(start_id:end_id);
h_limit_new = h_limit(start_id:end_id,:);
end

