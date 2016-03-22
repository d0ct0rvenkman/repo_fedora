# SRPM repos for Fedora and updates
class repo_fedora::source {

  include repo_fedora

  if $repo_fedora::enable_source {
    $enabled = '1'
  } else {
    $enabled = '0'
  }

#baseurl=http://download.fedoraproject.org/pub/fedora/linux/releases/$releasever/Everything/source/SRP
#metalink=https://mirrors.fedoraproject.org/metalink?repo=fedora-source-$releasever&arch=$basearch

  # Yumrepo ensure only in Puppet >= 3.5.0
  if versioncmp($::puppetversion, '3.5.0') >= 0 {
    Yumrepo <| title == 'fedora-source' |> { ensure => $repo_fedora::ensure_source }
    Yumrepo <| title == 'updates-source' |> { ensure => $repo_fedora::ensure_source }
  }

  yumrepo { 'fedora-source':
    baseurl  => "${repo_fedora::source_repourl}/releases/\$releasever/Everything/source/SRPMS",
    descr    => 'Fedora $releasever - Sources',
    enabled  => $enabled,
    gpgcheck => '1',
    gpgkey   => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-f${::repo_fedora::releasever}",
  }

  yumrepo { 'updates-source':
    baseurl  => "${repo_fedora::source_repourl}/updates/\$releasever/SRPMS/",
    descr    => 'Fedora $releasever - Updates Source',
    enabled  => $enabled,
    gpgcheck => '1',
    gpgkey   => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-f${::repo_fedora::releasever}",
  }

}
