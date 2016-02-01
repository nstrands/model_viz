clear
close
clc

dirdate = datestr(now, 'mmddyyyy');
ncFile = ['/www/home/nstrands/public_html/ru29_data/' dirdate '/' dirdate '.nc'];

lon = nc_varget(ncFile, 'longitude');
lat = nc_varget(ncFile, 'latitude');

%100
u100 = nc_varget(ncFile, 'u',[0 22 0 0], [1 1 inf inf]);
v100 = nc_varget(ncFile, 'v',[0 22 0 0], [1 1 inf inf]);
%360
u350 = nc_varget(ncFile, 'u',[0 28 0 0], [1 1 inf inf]);
v350 = nc_varget(ncFile, 'v',[0 28 0 0], [1 1 inf inf]);
%550
u550 = nc_varget(ncFile, 'u',[0 31 0 0], [1 1 inf inf]);
v550 = nc_varget(ncFile, 'v',[0 31 0 0], [1 1 inf inf]);

mean_u(:,:,1) = u100;
mean_u(:,:,2) = u350;
mean_u(:,:,3) = u550;
mean_u = mean(mean_u,3);

mean_v(:,:,1) = v100;
mean_v(:,:,2) = v350;
mean_v(:,:,3) = v550;
mean_v = mean(mean_v,3);

mean_u_half = resizem(mean_u,.25);
mean_v_half = resizem(mean_v,.25);

[Lon Lat] = meshgrid(lon, lat);

Lon_half = resizem(Lon, .25);
Lat_half = resizem(Lat, .25);

kmlStr = [ge_quiver(Lon_half, Lat_half, mean_u_half, mean_v_half,  'altitude', 3, 'magnitudeScale', 1,...
    'lineWidth', 1.5, 'lineColor', 'FFFFDB00')];
ge_output([ '/www/home/nstrands/public_html/ru29_data/' dirdate '/' dirdate '_avg_copernicus.kmz'], kmlStr);

kmlStr = [ge_quiver(Lon_half, Lat_half, mean_u_half, mean_v_half,  'altitude', 2, 'magnitudeScale', 1,...
    'lineWidth', 1.5, 'lineColor', 'FFFFDB00')];
ge_output(['/www/home/nstrands/public_html/ru29_data/src/ru29_avg_copernicus.kmz'], kmlStr);
