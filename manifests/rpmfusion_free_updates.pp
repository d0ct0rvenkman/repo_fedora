# The RPMFusion Free repository
class repo_fedora::rpmfusion_free_updates {

  include repo_fedora

  if $repo_fedora::enable_rpmfusion_free_updates {
    $enabled = '1'
  } else {
    $enabled = '0'
  }
  if $repo_fedora::enable_mirrorlist {
    $mirrorlist = "${repo_fedora::rpmfusion_mirrorlist}/mirrorlist?repo=free-fedora-updates-released-${::repo_fedora::releasever}&arch=\$basearch"
    $baseurl = 'absent'
  } else {
    $mirrorlist = 'absent'
    $baseurl = "${repo_fedora::rpmfusion_free_updates_repourl}/${::repo_fedora::releasever}/${::repo_fedora::releasever}/\$basearch/"
  }

  # Yumrepo ensure only in Puppet >= 3.5.0
  if versioncmp($::puppetversion, '3.5.0') >= 0 {
    Yumrepo <| title == 'rpmfusion-free-updates' |>
      { ensure => $repo_fedora::ensure_rpmfusion_free_updates }
  }

  yumrepo { 'rpmfusion-free-updates':
    baseurl    => $baseurl,
    mirrorlist => $mirrorlist,
    descr      => 'RPM Fusion for Fedora $releasever - Free - Updates',
    enabled    => $enabled,
    gpgcheck   => '1',
    gpgkey     => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-free-fedora-${repo_fedora::releasever}"
    #priority   => '1',
  }

}
