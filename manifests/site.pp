# site.pp

#hiera_include('classes') (didn't work, don't know why)

#Use to test puppet changes on a single node by fqdn (use the fdqn known about in hepcms-foreman web page)
# default node MUST exist (do all the rest of the default type things in base.pp, note that 
# hepcms-hn and hepcms-foreman are NOT part of base.pp, and that's ok)
node default {
}

# example implementation:
node 'hepcms-vmtest'{
  file { '/test':
     ensure => 'symlink',
     target => '/data/hadoop',
   }
}
node 'foreman-vmtest2'{
include ::osg
include ::profile::osg:hadoop_client
# hadoop mountpoint
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
}
}