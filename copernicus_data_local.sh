#!/bin/bash
clear

cd /Volumes/nstrands/scripts/
date1=$(date +'%m%d%Y')
currdate=$(date +'%Y-%m-%d 12:00:00')
mkdir /Volumes/pub_dir/ru29_data/$date1

python motu-client-python/motu-client.py -u nstrandskov -p 91y8ig9B -m http://atoll.mercator-ocean.fr/mfcglo-mercator-gateway-servlet/Motu -s http://purl.org/myocean/ontology/service/database#GLOBAL_ANALYSIS_FORECAST_PHYS_001_002-TDS -d global-analysis-forecast-phys-001-002 -x -42 -X -25 -y -35 -Y -25 -t “$currdate" -T “$currdate" -z 0.49 -Z 1062.44 -v v -v u -v salinity -v temperature -o /Volumes/pub_dir/ru29_data/$date1/ -f $date1.nc
