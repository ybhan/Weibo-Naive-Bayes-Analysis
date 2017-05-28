% May 24, 2017
% Edited by Jingbo Gao

% plot a China MAP and use the depth of color to illustrate the
% distribution of active users & all users. The relavant China map data is 
% downloaded from National Geomatics Center of China(NGCC)'s official
% website.

% load neccessary data if needed
if ~exist('data', 'var')
    load ../Weibodata.mat
end
if ~exist('Active_users', 'var')
    load ../Active_users.mat
end

% load the map data from /maps/bou2_4p.shp
sheng = shaperead('maps/bou2_4p.shp', 'UseGeoCoords', true);

% replace GB2312 with utf-8
load chinese_name.mat
for i = 1 : length(sheng)
    sheng(i).NAME = sheng_chinese_name{i};
end
clear sheng_chinese_name;

% import the provinces and cities names existed in China from ex.txt
d=importdata('ex.txt');
ddata = d.data;
textddata = d.textdata;
clear d;

% The 1st figure
% calculate the sum of ACTIVE USERS of each provinces and cities
pro_name = {...
    'Others', 'Zhejiang', 'Shanxi', 'Jiangxi', 'Shanghai', 'Tianjin',...
    'Fujian', 'Liaoning', 'Guangdong', 'Beijing', 'Shandong', 'Heilongjiang', ...
    'Hebei', 'Anhui', 'Jiangsu', 'Hainan', 'Taiwan', 'Hunan', 'Sichuan',...
    'Shannxi', 'Jilin', 'Henan', 'Xinjiang', 'Hubei', 'Guangxi', 'Overseas',...
    'Chongqing',  'Neimeng', 'Gansu', 'Hongkong', 'Macao', 'Guizhou', 'Yunnan',...
    'Tibet', 'Qinghai', 'Ningxia'};
for i = 1 : length(ddata)
    for j = 1 : length(pro_name)
        if strcmp(pro_name(j), textddata(i))
            break;
        end
    end
    ddata(i) = sum([Active_users.province] == j);
end

% Prepare for calculating the depth of color
k = 128;
mycolormap = cool(k);
geoname = {sheng.NAME};
max_ddata = max(ddata);
n = length(ddata);
mysymbolspec = cell(1, n);

% calculate the depth of color
for i = 1 : n
    count = ddata(i);
    mycoloridx = floor(k * count / max_ddata);
    mycoloridx(mycoloridx < 1) = 1; %fill the blanks
    
    myprovince = textddata{i};
    geoidx = strmatch(myprovince, geoname);
    
    if numel(geoidx) > 0
        province_name = geoname(geoidx(1));
        mysymbolspec{i} = {'NAME', char(province_name), 'FaceColor', mycolormap(mycoloridx, :)};
    end
end

% plot figure
figure;
subplot(1, 2 ,1);
ax = worldmap('china');
setm(ax, 'grid', 'off');
setm(ax, 'frame', 'off');
setm(ax, 'parallellabel', 'off');
setm(ax, 'meridianlabel', 'off');
symbols = makesymbolspec('Polygon', {'default', 'FaceColor', [0.9 0.9 0.8],...
    'LineStyle', '--', 'LineWidth', 0.2, 'EdgeColor', [0.8 0.9 0.9]},...
    mysymbolspec{:});
geoshow(sheng, 'SymbolSpec', symbols);
colormap(cool(k));
hcb = colorbar('EastOutside');
step = round(max_ddata / 11);
set(hcb, 'YTick', (0 : 0.1 : 1));
set(hcb, 'YTickLabel', num2cell(0 : step : max_ddata));
title('The Distribution of Active users in China', 'FontSize', 12);

% The 2nd figure
% plot a china MAP and use the depth of color to illustrate the
% distribution of ALL of the users

% calculate the sum of ALL USERS of each provinces and cities
for i = 1 : length(ddata)
    for j = 1 : length(pro_name)
        if strcmp(pro_name(j), textddata(i))
            break;
        end
    end
    ddata(i) = sum([data.province] == j);
end

% prepare for calculating the depth of color
k = 128;
mycolormap = cool(k);

% calculate the depth of color
geoname = {sheng.NAME};
max_ddata = max(ddata);
n = length(ddata);
mysymbolspec = cell(1,n);
for i = 1 : n
    count=ddata(i);
    mycoloridx=floor(k * count / max_ddata);
    mycoloridx(mycoloridx < 1) = 1; %fill the blanks
    
    myprovince = textddata{i};
    geoidx = strmatch(myprovince, geoname);
    
    if numel(geoidx) > 0
        province_name = geoname(geoidx(1));
        mysymbolspec{i} = {'NAME', char(province_name), 'FaceColor', mycolormap(mycoloridx, :)};
    end
end

% plot the figure
subplot(1, 2 ,2);
ax = worldmap('china');
setm(ax, 'grid', 'off');
setm(ax, 'frame', 'off');
setm(ax, 'parallellabel', 'off');
setm(ax, 'meridianlabel', 'off');
symbols = makesymbolspec('Polygon', {'default', 'FaceColor', [0.9 0.9 0.8],...
    'LineStyle', '--', 'LineWidth', 0.2, 'EdgeColor', [0.8 0.9 0.9]},...
    mysymbolspec{:});
geoshow(sheng, 'SymbolSpec', symbols);
colormap(cool(k));
hcb = colorbar('EastOutside');
step = round(max_ddata / 11);
set(hcb, 'YTick', (0 : 0.1 : 1));
set(hcb, 'YTickLabel', num2cell(0 : step : max_ddata));
title('The Distribution of All users in China', 'FontSize', 12);