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
start_time = 41854996.42; end_time = 41854997.5; 

[start_id,end_id,data_selected] = select_photon(data,segment,start_time,end_time);
plot(data_selected.delta_time,data_selected.height,'b.','MarkerSize',0.10)


% 找到水面的大致位置
[his_seg,h_limit]= build_his2(data_selected,segment.segment_start_time(start_id),segment.segment_end_time(end) ,0.1,0.5);
[pks,locs] = findpeaks(his_seg,'minpeakdistance',10);
[~,id]=sort(pks,'descend'); pks = pks(id(1:2)); locs = locs(id(1:2));
start_h_t = h_limit(:,1);
peak_hei_loc = start_h_t(locs);
water_loc = max(peak_hei_loc);

plot(h_limit(:,1),his_seg)
set(gca,'XDir','reverse');        %将x轴方向设置为反向(从右到左递增)。
xlabel('elevation (meters)')
ylabel('Photon Line Density(photons/m)')
