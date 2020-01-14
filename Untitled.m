% 本代码为在时间范围内画图，写分析结论

start_time = 41854996.42; end_time = 41854997.5; 


data_ocean = struct_filter(data,sel_id);
sel_id2 = (data_ocean.delta_time>=start_time)&(data_ocean.delta_time<=end_time);
data_ocean = struct_filter(data_ocean,sel_id2);


data_under_ocean = struct_filter(data,select_id);
select_id2 = (data_under_ocean.delta_time>=start_time)&(data_under_ocean.delta_time<=end_time);
data_under_ocean = struct_filter(data_under_ocean,select_id2);


id22 = (data_selected.delta_time>=start_time)&(data_selected.delta_time<=end_time);
data_selected = struct_filter(data_selected,id22);

plot(data_selected.dis - data_selected.dis(1),data_selected.height,'b.','MarkerSize',10)
hold on 
plot(data_ocean.dis - data_selected.dis(1),data_ocean.height,'r.','MarkerSize',10)
hold on
plot(data_under_ocean.dis - data_selected.dis(1),data_under_ocean.height,'g.','MarkerSize',10)
xlabel('distance initial (m)')
ylabel('elevation (meters)')
legend('Raw Photon','Ocean Surface Photons','Under Water Photons');