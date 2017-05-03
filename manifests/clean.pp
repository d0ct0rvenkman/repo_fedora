# == Class: repo_fedora::clean
#
class repo_fedora::clean {

  if ($repo_fedora::enable_cleaning) {
    file { '/etc/yum.repos.d/':
      ensure  => directory,
      purge   => true,
      recurse => true,
    }
  }
}
