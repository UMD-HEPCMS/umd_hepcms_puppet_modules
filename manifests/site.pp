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
# include ::profile::osg::hadoop_client
}
node 'foreman-vmtest2'{
include ::profile::osg::hadoop_client
}
# node 'hepcms-in2'{
# include ::profile::osg::hadoop_client
# }