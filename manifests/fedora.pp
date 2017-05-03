# Base includes the Fedora Everything files from the initial release
class repo_fedora::fedora {

  include repo_fedora

  if $repo_fedora::enable_fedora {
    $enabled = '1'
  } else {
    $enabled = '0'
  }
  if $repo_fedora::enable_metalink {
    $metalink = "${repo_fedora::metalinkurl}/metalink?repo=fedora-${repo_fedora::releasever}&arch=\$basearch"
    $baseurl = 'absent'
  } else {
    $metalink = 'absent'
    $baseurl = "${repo_fedora::repourl}/releases/\$releasever/Everything/\$basearch/os/"
  }

  notify { "${repo_fedora::metalinkurl}/metalink?repo=\
fedora-${repo_fedora::releasever}&arch=\$basearch":}
  # Yumrepo ensure only in Puppet >= 3.5.0
  if versioncmp($::puppetversion, '3.5.0') >= 0 {
    Yumrepo <| title == 'fedora' |> { ensure => $repo_fedora::ensure_fedora }
  }

  yumrepo { 'fedora':
    baseurl         => $baseurl,
    metalink        => $metalink,
    metadata_expire => '6h'
    descr           => 'Fedora $releasever - $basearch',
    enabled         => $enabled,
    gpgcheck        => '1',
    gpgkey          => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-${::repo_fedora::releasever}-\$basearch",
    #priority       => '1',
  }

}
