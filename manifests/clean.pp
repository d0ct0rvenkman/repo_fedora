# == Class: repo_fedora::clean
#
class repo_fedora::clean {

  file { '/etc/yum.repos.d/fedora.repo': ensure => absent }
  file { '/etc/yum.repos.d/fedora-updates.repo': ensure => absent }
  file { '/etc/yum.repos.d/fedora-updates-testing.repo': ensure => absent }
}
