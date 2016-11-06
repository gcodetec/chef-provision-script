#! /bin/bash
export NEWRELIC_LICENSE_KEY=$(curl http://metadata.google.internal/computeMetadata/v1/instance/attributes/newrelic-license-key -H "Metadata-Flavor: Google")
sudo apt-get update
sudo apt-get -y install curl git
curl https://omnitruck.chef.io/install.sh | sudo bash -s -- -P chefdk -c stable -v 0.16.28
mkdir /tmp/chef-repo
sudo chef-client --local-mode /tmp/chef-repo/webserver.rb