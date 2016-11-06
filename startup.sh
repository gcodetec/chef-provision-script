#! /bin/bash
CHEFDK_VERSION=0.19.6
if [ "$NEWRELIC_LICENSE_KEY" == "" ]
then
    export NEWRELIC_LICENSE_KEY=$(curl http://metadata.google.internal/computeMetadata/v1/instance/attributes/newrelic-license-key -H "Metadata-Flavor: Google")
fi
echo $NEWRELIC_LICENSE_KEY > /tmp/newrelic_license_key
sudo apt-get update
sudo apt-get -y install curl git
curl https://omnitruck.chef.io/install.sh | sudo bash -s -- -P chefdk -c stable -v $CHEFDK_VERSION
git clone https://github.com/gcodetec/tsuru-docker-node.git
cd tsuru-docker-node && berks install && berks vendor /cookbooks && cd ../
sudo chef-client --local-mode --runlist 'recipe[tsuru-docker-node]'
