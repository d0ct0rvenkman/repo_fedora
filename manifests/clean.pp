# == Class: repo_fedora::clean
#
class repo_fedora::clean {

  file { '/etc/yum.repos.d/': 
    ensure  => directory,
    purge   => true,
    recurse => true,
  }
}
