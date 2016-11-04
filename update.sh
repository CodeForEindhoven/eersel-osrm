if [ ! -f osmupdate ]; then
    echo "[warn] osmupdate not found, installing"
    wget -O - http://m.m.i24.cc/osmupdate.c | cc -x c - -o osmupdate
fi
echo "[info] installed osmupdate"

if [ ! -f osmconvert ]; then
    echo "[warn] osmconvert not found, installing"
    wget -O - http://m.m.i24.cc/osmconvert.c | cc -x c - -lz -O3 -o osmconvert
fi
echo "[info] installed osmconvert"

if [ ! -f osmfilter ]; then
    echo "[warn] osmfilter not found, installing"
    wget -O - http://m.m.i24.cc/osmfilter.c | cc -x c - -O3 -o osmfilter
fi
echo "[info] installed osmfilter"

if [ ! -f temp-planet-latest.osm.pbf ]; then
    echo "[warn] no planet found, downloading"
    wget http://download.geofabrik.de/europe/netherlands-latest.osm.pbf -O temp-planet-latest.osm.pbf
else
    echo "[info] skip download"
fi
echo "[info] starting osm planet update"
./osmupdate temp-planet-latest.osm.pbf planet-latest.osm.pbf -B=eersel_noord-brabant.poly
cp planet-latest.osm.pbf temp-planet-latest.osm.pbf
echo "[info] creating extract for Eersel"
./osmconvert planet-latest.osm.pbf -B=eersel_noord-brabant.poly --complete-ways -o=eersel_noord-brabant.osm
echo "[info] extract road network for Eersel"
./osmfilter eersel_noord-brabant.osm --keep="highway=" -o=eersel_wegen.osm
echo "[info] update finished"
