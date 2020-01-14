clc
clear

dbstop if all error
addpath(genpath('./'))
addpath('../')

filepath = 'D:\first year PhD\2020IGRASS\';
filename = 'ATL03_20190430102139_04910307_002_01.h5';
[data,segment] = ICESat2_read(filename,filepath, 1, 'strong');
[segment.segment_start_time, segment.segment_end_time] = segment_cal(segment);
% plot(data.delta_time,data.height,'b.','MarkerSize',0.10)

% 选取数据区域
start_time = 41854996; end_time = 41855000; 

[start_id,end_id,data_selected] = select_photon(data,segment,start_time,end_time);
plot(data_selected.delta_time,data_selected.height,'b.','MarkerSize',0.10)


% 找到水面的大致位置
[his_seg,h_limit]= build_his2(data_selected,segment.segment_start_time(start_id),segment.segment_end_time(end) ,0.1,1);
[pks,locs] = findpeaks(his_seg,'minpeakdistance',10);
[~,id]=sort(pks,'descend'); pks = pks(id(1:2)); locs = locs(id(1:2));
start_h_t = h_limit(:,1);
peak_hei_loc = start_h_t(locs);
water_loc = max(peak_hei_loc);
plot(h_limit(:,1),his_seg)

% 寻找水面光子
sig_thickness = 2;
semi_limit = 1; width_jump=25;width_window = 50;height_centre_bou = 0.1;
[sel_id] = select_sea_photon(data_selected,water_loc,sig_thickness,height_centre_bou,semi_limit,width_jump,width_window...
    ,start_id,end_id,segment);
% 第一步建立直方图
[his_seg,h_limit]= build_his2(data_selected,segment.segment_start_time(start_id+600),segment.segment_end_time(start_id+610) ,0.1,1);
[pks,locs] = findpeaks(his_seg);
plot(h_limit(:,1),his_seg)

% plot(data_selected.delta_time,data_selected.height,'b.','MarkerSize',0.10)
% hold on 
% plot(data.delta_time(sel_id),data.height(sel_id),'r.','MarkerSize',0.10)

% 删除海面光子
id_other = setdiff(data_selected.id,sel_id);
data_other.id = id_other;
data_other.delta_time = data.delta_time(id_other);
data_other.height = data.height(id_other);
data_other.dis =  data.dis(id_other);

select_id = planA(data_other,segment,start_id,end_id);

plot(data_selected.delta_time,data_selected.height,'b.','MarkerSize',0.10)
hold on 
plot(data.delta_time(sel_id),data.height(sel_id),'r.','MarkerSize',0.10)
hold on
plot(data.delta_time(select_id),data.height(select_id),'g.','MarkerSize',0.10)

% data_sea_surface.id = sel_id; data_sea_surface.delta_time = data.delta_time(sel_id);
% data_sea_surface.height = data.height(sel_id); data_sea_surface.dis = data.dis(sel_id);
% 
% data_under.id = select_id; data_under.delta_time = data.delta_time(select_id);
% data_under.height = data.height(select_id); data_under.dis = data.dis(select_id);
% 
% num_seg = 50;
% perform_circle(data,data_sea_surface,data_under,segment,num_seg,start_id,end_id)

