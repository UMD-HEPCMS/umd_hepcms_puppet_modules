# site.pp

#hiera_include('classes')
#Use to test puppet changes on a single node
node 'hepcms-in1.umd.edu' {
  yum_autoupdate_ensure => 'absent'
}