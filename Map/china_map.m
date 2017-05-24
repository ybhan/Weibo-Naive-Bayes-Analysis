load ../Weibodata.mat
load ../Active_users.mat
load chinese_name.mat

sheng = shaperead('maps/bou2_4p.shp', 'UseGeoCoords', true);
for i = 1 : length(sheng)
    sheng(i).NAME=sheng_chinese_name{i};
end

d=importdata('ex.txt');
ddata = d.data;
textddata = d.textdata;

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

k = 128;
mycolormap = summer(k);

geoname = {sheng.NAME};
max_ddata = max(ddata);
n = length(ddata);
mysymbolspec = cell(1,n);
for i = 1 : n
    count=ddata(i);
    mycoloridx=floor(k * count / max_ddata);
    mycoloridx(mycoloridx < 1) = 1;
    myprovince = textddata{i};
    geoidx = strmatch(myprovince, geoname);
    if numel(geoidx) > 0
        province_name=geoname(geoidx(1));
        mysymbolspec{i} = {'NAME', char(province_name), 'FaceColor', mycolormap(mycoloridx, :)};
    end
end

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

colormap(summer(k));
hcb = colorbar('EastOutside');
step = round(max_ddata / 11);
set(hcb, 'YTick', (0 : 0.1 : 1));
set(hcb, 'YTickLabel', num2cell(0 : step : max_ddata));

%
for i = 1 : length(ddata)
    for j = 1 : length(pro_name)
        if strcmp(pro_name(j), textddata(i))
            break;
        end
    end
    ddata(i) = sum([data.province] == j);
end

k = 128;
mycolormap = summer(k);

geoname = {sheng.NAME};
max_ddata = max(ddata);
n = length(ddata);
mysymbolspec = cell(1,n);
for i = 1 : n
    count=ddata(i);
    mycoloridx=floor(k * count / max_ddata);
    mycoloridx(mycoloridx < 1) = 1;
    myprovince = textddata{i};
    geoidx = strmatch(myprovince, geoname);
    if numel(geoidx) > 0
        province_name=geoname(geoidx(1));
        mysymbolspec{i} = {'NAME', char(province_name), 'FaceColor', mycolormap(mycoloridx, :)};
    end
end

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

colormap(summer(k));
hcb = colorbar('EastOutside');
step = round(max_ddata / 11);
set(hcb, 'YTick', (0 : 0.1 : 1));
set(hcb, 'YTickLabel', num2cell(0 : step : max_ddata));