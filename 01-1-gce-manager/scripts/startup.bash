#!/bin/bash

# install terraform
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update && sudo apt-get install terraform

# install terragrunt
sudo curl -L https://github.com/gruntwork-io/terragrunt/releases/download/v0.36.6/terragrunt_linux_amd64 -o /usr/local/bin/terragrunt
sudo chmod +x /usr/local/bin/terragrunt
