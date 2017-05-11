% May 11, 2017
% Edited by Jingbo Gao

% plot the graph of the MEAN and  users sign up

for province = 1 : 36
    pro_id_tmp = find(([data.province] == province) ~= 0);
    tmp = [data(pro_id_tmp).time];
    sum_province(province).mean = mean([tmp.year]);
    sum_province(province).std = std([tmp.year]);
end
figure;

