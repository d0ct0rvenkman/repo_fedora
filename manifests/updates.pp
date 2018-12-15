# The Fedora Updates repository
class repo_fedora::updates {

  include repo_fedora

  if $repo_fedora::enable_updates {
    $enabled = '1'
  } else {
    $enabled = '0'
  }
  if $repo_fedora::enable_metalink {
    $metalink = "${repo_fedora::metalinkurl}/metalink?repo=updates-released-f${::repo_fedora::releasever}&arch=\$basearch"
    $baseurl = 'absent'
  } else {
    $metalink = 'absent'
    $baseurl = "${repo_fedora::repourl}/updates/\$releasever/Everything/\$basearch/"
  }

  # Yumrepo ensure only in Puppet >= 3.5.0
  if versioncmp($::puppetversion, '3.5.0') >= 0 {
    Yumrepo <| title == 'updates' |> { ensure => $repo_fedora::ensure_updates }
  }

  yumrepo { 'updates':
    baseurl         => $baseurl,
    metalink        => $metalink,
    metadata_expire => '6h',
    descr           => 'Fedora $releasever - $basearch - Updates',
    enabled         => $enabled,
    gpgcheck        => '1',
    gpgkey          => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-${repo_fedora::releasever}-\$basearch",
    #priority        => '1',
  }

}
