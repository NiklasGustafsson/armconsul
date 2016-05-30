echo Installing dependencies...
sudo apt-get update
sudo apt-get install -y unzip curl

echo Fetching Consul...

pwd > /home/consul/whereami.txt

sudo mkdir /etc/consul.d
sudo chmod a+w /etc/consul.d

sudo mkdir /etc/consul.d/server
sudo chmod a+w /etc/consul.d/server
sudo mkdir /etc/consul.d/client
sudo chmod a+w /etc/consul.d/client

mkdir /home/consul/consul
chmod a+w /home/consul/consul

cat client.conf | sed s/AGENT/$1/ | sed s/CONSUL_ADDR/$2/g > /tmp/client.conf

sudo cp bootstrap.json /etc/consul.d/bootstrap/config.json
sudo cp server.json /etc/consul.d/server/config.json
sudo cp client.json /etc/consul.d/client/config.json
sudo cp /tmp/client.conf /etc/init/consul.conf

cd /tmp/

curl https://releases.hashicorp.com/consul/0.6.4/consul_0.6.4_linux_amd64.zip -o consul.zip

echo Installing Consul...
unzip consul.zip

sudo chmod +x consul
sudo mv consul /usr/bin/consul
