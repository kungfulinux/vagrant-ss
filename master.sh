#!/bin/bash

# Perform a few steps first
export PATH=$PATH:/opt/puppet/bin
/opt/puppet/bin/puppet module install zack/r10k
/sbin/service iptables stop

/bin/mv /etc/puppetlabs/puppet/environments/production /etc/puppetlabs/puppet/environments/production-ORIG

cd /tmp
git clone https://github.com/kungfulinux/puppet_repository-new.git

cd puppet_repository-new
/opt/puppet/bin/puppet module install zack/r10k
/opt/puppet/bin/puppet apply configure-r10k.pp
/opt/puppet/bin/puppet apply configure_directory_environments.pp
r10k deploy environment -pv

