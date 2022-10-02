
cp db.dnas.rpz data/bind/etc/
cp named.conf.local data/bind/etc/
cp named.conf.default-zones data/bind/etc/
cp named.conf.options data/bind/etc/

sed -i "s/GATE_IP/${GATE_IP}/g" data/bind/etc/db.dnas.rpz
sed -i "s/PROD_IP/${PROD_IP}/g" data/bind/etc/db.dnas.rpz
sed -i "s/BETA_IP/${BETA_IP}/g" data/bind/etc/db.dnas.rpz

docker run --name bind -d --rm \
	  --publish 53:53/tcp --publish 53:53/udp --publish 10000:10000/tcp \
	    --volume "${PWD}/data":"/data" \
	      sameersbn/bind
