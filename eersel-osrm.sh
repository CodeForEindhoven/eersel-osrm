docker pull osrm/osrm-backend:v5.4.1
docker run -t -v $(pwd):/data osrm/osrm-backend:v5.4.1 osrm-extract -p /data/dog.lua /data/eersel_noord-brabant.osm
docker run -t -v $(pwd):/data osrm/osrm-backend:v5.4.1 osrm-contract /data/eersel_noord-brabant.osrm
docker run -t -i -p 5000:5000 -v $(pwd):/data osrm/osrm-backend:v5.4.1 osrm-routed /data/eersel_noord-brabant.osrm
