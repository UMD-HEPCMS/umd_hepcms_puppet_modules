# site.pp

#hiera_include('classes')
node 'hepcms-in2.umd.edu' {
# make symlink test on one site
# http://www.puppetcookbook.com/posts/creating-a-directory.html
# create a directory      
#file { "/etc/site-conf":
#    ensure => "directory",
#}
# ln -s /data/hadoop /hadoop
# ln -s /data/hadoop/store /store 
file { '/hadoop':
  ensure => 'symlink',
  target => '/data/hadoop',
}
file { '/store':
  ensure => 'symlink',
  target => '/data/hadoop/store',
}
}