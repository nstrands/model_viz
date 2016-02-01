clear
close
clc

dirdate = datestr(now, 'mmddyyyy');
ncFile = ['/www/home/nstrands/public_html/ru29_data/' dirdate '/' dirdate '.nc'];

lon = nc_varget(ncFile, 'longitude');
lat = nc_varget(ncFile, 'latitude');


u = nc_varget(ncFile, 'u',[0 0 0 0], [1 1 inf inf]);
v = nc_varget(ncFile, 'v',[0 0 0 0], [1 1 inf inf]);

%u(1) = -1.5;
%u(end) = 1.5;
%v(1) = 0;
%v(end) = 0;

mean_u_half = resizem(u,.25);
mean_v_half = resizem(v,.25);

[Lon Lat] = meshgrid(lon, lat);

Lon_half = resizem(Lon, .25);
Lat_half = resizem(Lat, .25);

kmlStr = [ge_quiver(Lon_half, Lat_half, mean_u_half, mean_v_half,  'altitude', 3, 'magnitudeScale', 1,...
    'lineWidth', 1.5, 'lineColor', 'FFFFDB00')];
ge_output([ '/www/home/nstrands/public_html/ru29_data/' dirdate '/' dirdate '_surf_copernicus2.kmz'], kmlStr);

kmlStr = [ge_quiver(Lon_half, Lat_half, mean_u_half, mean_v_half,  'altitude', 2, 'magnitudeScale', 1,...
    'lineWidth', 1.5, 'lineColor', 'FFFFDB00')];
ge_output(['/www/home/nstrands/public_html/ru29_data/src/ru29_surf_copernicus2.kmz'], kmlStr);
