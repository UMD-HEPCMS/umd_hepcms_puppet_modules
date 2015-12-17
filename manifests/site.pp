# site.pp

#hiera_include('classes') (didn't work, don't know why)

#Use to test puppet changes on a single node by fqdn (use the fdqn known about in hepcms-foreman web page)
# default node MUST exist (do all the rest of the default type things in base.pp, note that 
# hepcms-hn and hepcms-foreman are NOT part of base.pp, and that's ok)
#hiera_include('classes')
node default {
}
### you MUST put hiera_include('classes') in your individual nodes if you want it to use hiera classes
# example implementation:
# note that .privnet not needed, but .umd.edu might be for public IP nodes
#node 'FQDN-As-Foreman-KnowsIt'{
#  file { '/test':
#     ensure => 'symlink',
#     target => '/data/hadoop',
#   }
#}
node 'hepcms-vmtest'{
#hiera_include('classes')
#include ::profile::osg::hadoop_client
# included in ::profile::osg::hadoop_client above now!
# # hadoop mountpoint
# file { "/mnt/hadoop": ensure => directory }
# mount { "mount_hadoop":
#          name    => "/mnt/hadoop",
# 	device  => "hadoop-fuse-dfs",
# 	fstype  => "fuse",
# 	ensure  => mounted,
# 	options => "server=hepcms-namenode.privnet,port=9000,rdbuffer=131072,allow_other",
# 	atboot  => true,
# 	remounts => false,
# 	require => [ File["/mnt/hadoop"] ],
# }
}
node 'foreman-vmtest2'{
include ::profile::osg::hadoop_client
# 
# # hadoop mountpoint
# file { "/mnt/hadoop": ensure => directory }
# mount { "mount_hadoop":
#          name    => "/mnt/hadoop",
# 	device  => "hadoop-fuse-dfs",
# 	fstype  => "fuse",
# 	ensure  => mounted,
# 	options => "server=hepcms-namenode.privnet,port=9000,rdbuffer=131072,allow_other",
# 	atboot  => true,
# 	remounts => false,
# 	require => [ File["/mnt/hadoop"] ],
# }
}
node 'hepcms-in2'{
include ::profile::osg::hadoop_client
 
# # hadoop mountpoint
 file { "/mnt/hadoop": ensure => directory }
 mount { "mount_hadoop":
    name    => "/mnt/hadoop",
 	device  => "hadoop-fuse-dfs",
 	fstype  => "fuse",
 	ensure  => mounted,
 	options => "server=hepcms-namenode.privnet,port=9000,rdbuffer=131072,allow_other",
 	atboot  => true,
 	remounts => false,
 	require => [ File["/mnt/hadoop"] ],
 	require => Package['osg-se-hadoop-client']
 }
}