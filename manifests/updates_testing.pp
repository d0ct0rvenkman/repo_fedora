# The Fedora Updates testing repository
class repo_fedora::updates_testing {

  include repo_fedora

  if $repo_fedora::enable_updates_testing {
    $enabled = '1'
  } else {
    $enabled = '0'
  }
  if $repo_fedora::enable_mirrorlist {
    $mirrorlist = "${repo_fedora::mirrorlisturl}/metalink?repo=\
updates-testing-f${::repo_fedora::releasever}&arch=\$basearch"
    $baseurl = 'absent'
  } else {
    $mirrorlist = 'absent'
    $baseurl = "${repo_fedora::repourl}/updates/testing/\$releasever/\$basearch/"

  }

  # Yumrepo ensure only in Puppet >= 3.5.0
  if versioncmp($::puppetversion, '3.5.0') >= 0 {
    Yumrepo <| title == 'fedora-updates-testing' |>
      { ensure => $repo_fedora::ensure_updates_testing }
  }

  yumrepo { 'updates-testing':
    baseurl    => $baseurl,
    mirrorlist => $mirrorlist,
    descr      => 'Fedora $releasever - $basearch - Updates',
    enabled    => $enabled,
    gpgcheck   => '1',
    gpgkey     => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-${repo_fedora::releasever}-\$basearch",
    #priority   => '1',
  }

}
