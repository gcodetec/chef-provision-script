#! /bin/bash
export NEWRELIC_LICENSE_KEY=$(curl http://metadata.google.internal/computeMetadata/v1/instance/attributes/newrelic-license-key -H "Metadata-Flavor: Google")
echo deb http://apt.newrelic.com/debian/ newrelic non-free >> /etc/apt/sources.list.d/newrelic.list
wget -O- https://download.newrelic.com/548C16BF.gpg | apt-key add -
sudo apt-get update
sudo apt-get -y install curl git newrelic-sysmond
nrsysmond-config --set license_key=$NEWRELIC_LICENSE_KEY
/etc/init.d/newrelic-sysmond start
curl https://omnitruck.chef.io/install.sh | sudo bash -s -- -P chefdk -c stable -v 0.16.28
