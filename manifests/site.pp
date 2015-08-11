# site.pp

#hiera_include('classes')
# added 11 Aug 2015 per instructions for iptables: https://github.com/treydock/puppet-iptables
Firewall {
  before  => Class['iptables::post'],
  require => Class['iptables::pre'],
}