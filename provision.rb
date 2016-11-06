require 'chef/provisioning'

with_machine_options({
                       :bootstrap_options => {
                         :image_name => 'ubuntu-1404-trusty-v20161020',
                         :zone_name => 'us-east1-b',
                         :machine_type => 'f1-micro',
                         # :key_name => 'id_rsa',  # this is the local name of your SSH private key.
                         # You'll need to set up your ssh-key via: Home > Compute Engine > Metadata > SSH Keys and upload your public key
                         :tags => ["fog", "http-server"],
                         :metadata => {
                             "newrelic-license-key" => ENV["NEWRELIC_LICENSE_KEY"]
                             "startup-script-url" => ""}
                       }
                     })

machine "serverbychef"
