# site.pp

#hiera_include('classes')
#Use to test puppet changes on a single node (note that the other nodes complain there's no default :(
#node 'hepcms-in1.umd.edu' {
#class { 'yum_cron':
#  yum_autoupdate_ensure => 'absent'
#}
#}
node default {
}
node 'foreman-vmtest2"{
class { 'yum_cron':
  yum_autoupdate_ensure => 'absent'
}
}