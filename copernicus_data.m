% Script to grab RTOFS Data for a specified point
% Written by Sage, 6/15/15, adjusted for copernicus by Nilsen 6/16/15
close all; clear all;

% Desired Coordinates, transition to an automated system when glider deployed
alat = -30.8763;
alon = -40.4331;

% copernicus data only available from marine.copernicus.eu
file = 'path/to/downloaded/copernicus/data'

% Find the closest model point
mlat = ncread(file,'lat');
mlon = ncread(file,'lon');
[X,Y]=meshgrid(mlon,mlat);
[nr,nc]=size(X);
d=distance(alat*ones(nr,nc),alon*ones(nr,nc),Y,X);
[iy ix]=find(d==min(min(d)));

% Grab the profile data
rt.date = ncread(url_s,'time_counter',1,1);
rt.lat = ncread(url_s,'latitude',iy,1);
rt.lon = ncread(url_s,'longitude',ix,1);
rt.lev = ncread(url_s,'depth');
msal = ncread(url_s,'salinity',[ix iy 1 1],[1 1 35 1]);
rt.sal = reshape(msal,35,1);
mtemp = ncread(url_t,'temperature',[ix iy 1 1],[1 1 35 1]);
rt.temp = reshape(mtemp,35,1);

% Save the profile to a file
save(['copernicus_' datestr(rt.date,'yyyymmdd') '_' num2str(alat) '_' num2str(alon) '.mat'],'rt');

disp(['copernicus data fetched and saved for ' datestr(rt.date)]);
