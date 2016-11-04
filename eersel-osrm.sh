docker pull osrm/osrm-backend:v5.4.1
docker run -t -v $(pwd):/data osrm/osrm-backend:v5.4.1 osrm-extract -p /data/winter.lua /data/eersel.osm
docker run -t -v $(pwd):/data osrm/osrm-backend:v5.4.1 osrm-contract /data/eersel.osrm
docker run -t -i -p 5000:5000 -v $(pwd):/data osrm/osrm-backend:v5.4.1 osrm-routed /data/eersel.osrm
