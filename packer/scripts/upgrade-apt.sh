#!/bin/sh

#Set default answer for any questions that might be asked
export DEBIAN_FRONTEND=noninteractive

sudo apt-get update -qq
sudo apt-get upgrade -y
