clear
close
clc

dirdate = datestr(now, 'mmddyyyy');
currdate = datestr(now, 'yyyymmdd');
output_directory = (['/www/home/nstrands/public_html/ru29_data/' dirdate '/']);

uveldata = ['/home/coolgroup/RTOFS/forecasts/gliders/ru29-451'...
    '/' currdate '/' currdate '/ru29-451_' currdate '_rtofs_glo_3dz_nowcast_daily_uvel.nc4.nc'];
vveldata = ['/home/coolgroup/RTOFS/forecasts/gliders/ru29-451/'...
    '/' currdate '/' currdate '/ru29-451_' currdate '_rtofs_glo_3dz_nowcast_daily_vvel.nc4.nc'];

z = nc_varget(uveldata, 'lev');
z = z(1:19,:);
lat = nc_varget(uveldata, 'lat');
lon = nc_varget(uveldata, 'lon');

u = nc_varget(uveldata, 'u',[2 1 0 0], [1 1 inf inf]);
v = nc_varget(vveldata, 'v',[2 1 0 0], [1 1 inf inf]);

%u(0,0) = -1.5;
%u(end) = 1.5;
%v(1) = 0;
%v(end) = 0;

mean_u_half = resizem(u,.25);
mean_v_half = resizem(v,.25);

[Lon, Lat] = meshgrid(lon, lat);

Lon_half = resizem(Lon, .25);
Lat_half = resizem(Lat, .25);

kmlStr = [ge_quiver(Lon_half, Lat_half, mean_u_half, mean_v_half,  'altitude', 2, 'magnitudeScale', 1,...
    'lineWidth', 1.5, 'lineColor', 'FF66FF33')];
ge_output(['/www/home/nstrands/public_html/ru29_data/' dirdate '/' dirdate '_surf_rtofs2.kmz'], kmlStr);


kmlStr = [ge_quiver(Lon_half, Lat_half, mean_u_half, mean_v_half,  'altitude', 2, 'magnitudeScale', 1,...
    'lineWidth', 1.5, 'lineColor', 'FF66FF33')];
ge_output(['/www/home/nstrands/public_html/ru29_data/src/ru29_surf_rtofs2.kmz'], kmlStr);

% for plotting rtofs ocean model data
% 1           0
% 2          10
% 3          20
% 4          30
% 5          50
% 6          75
% 7         100
% 8         125
% 9         150
% 10        200
% 11        250
% 12        300
% 13        400
% 14        500
% 15        600
% 16        700
% 17        800
% 18        900
% 19       1000
