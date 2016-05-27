echo Installing dependencies...
sudo apt-get update
sudo apt-get install -y unzip curl

echo Fetching Consul...
cd /tmp/
curl https://releases.hashicorp.com/consul/0.6.4/consul_0.6.4_linux_amd64.zip -o consul.zip

echo Installing Consul...
unzip consul.zip
sudo chmod +x consul
sudo mv consul /usr/bin/consul

sudo mkdir /etc/consul.d
sudo chmod a+w /etc/consul.d

sudo mkdir /etc/consul.d/server
sudo chmod a+w /etc/consul.d/server
sudo mkdir /etc/consul.d/client
sudo chmod a+w /etc/consul.d/client

mkdir /home/vagrant/consul
chmod a+w /home/vagrant/consul

cd /home/consul

ls /home/consul > home.lst
