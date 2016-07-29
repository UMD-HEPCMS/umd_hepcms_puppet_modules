# site.pp

#hiera_include('classes') (didn't work, don't know why)

#Use to test puppet changes on a single node by fqdn (use the fdqn known about in hepcms-foreman web page)
# default node MUST exist (do all the rest of the default type things in base.pp, note that
# hepcms-hn and hepcms-foreman are NOT part of base.pp, and that's ok)
# need this classes line in every node to be able to use classes in hiera
# hiera_include('classes',[]) (not sure if ,[] is needed, never tested, works without it right now 18 Dec 2015 MBT)
node default {
hiera_include('classes')
}
### the inherits default takes care of making sure classes are there for all nodes specified below
# example implementation:
# note that .privnet not needed, but .umd.edu might be for public IP nodes
#node 'FQDN-As-Foreman-KnowsIt'{
#  file { '/test':
#     ensure => 'symlink',
#     target => '/data/hadoop',
#   }
#}
node 'hepcms-vmtest' inherits default{
# include ::profile::osg::hadoop_client
}
node 'foreman-vmtest2' inherits default{
# include ::profile::osg::hadoop_client
}
node 'r510-0-4' inherits default{
  class {'::tuned':
    profile => 'UMD-T3',
    source => 'file:///data/site_conf/tune-profiles/UMD-T3',
  }
}
# node 'hepcms-in1' inherits default{
# # include ::profile::osg::hadoop_client
# hiera_include('classes',[])
# }
