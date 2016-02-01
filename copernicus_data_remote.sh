#!/bin/bash
clear
date1=$(date +'%m%d%Y')
currdate=$(date +'%Y-%m-%d')
hrs=' 12:00:00'
newdate=$currdate$hrs 
mkdir /www/home/nstrands/public_html/ru29_data/$date1

python motu-client-python/motu-client.py -u nstrandskov -p 91y8ig9B -m http://atoll.mercator-ocean.fr/mfcglo-mercator-gateway-servlet/Motu -s http://purl.org/myocean/ontology/service/database#GLOBAL_ANALYSIS_FORECAST_PHYS_001_002-TDS -d global-analysis-forecast-phys-001-002 -x 2 -X 30 -y -29 -Y -42 -t "$newdate" -T "$newdate"  -z 0.49 -Z 1062.44 -v v -v u -v salinity -v temperature -o /www/home/nstrands/public_html/ru29_data/$date1/ -f $date1.nc
