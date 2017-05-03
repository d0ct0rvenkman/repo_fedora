# The RPMFusion NonFree repository
class repo_fedora::rpmfusion_nonfree_updates {

  include repo_fedora

  if $repo_fedora::enable_rpmfusion_nonfree_updates {
    $enabled = '1'
  } else {
    $enabled = '0'
  }
  if $repo_fedora::enable_mirrorlist {
    $mirrorlist = "${repo_fedora::rpmfusion_mirrorlist}/mirrorlist?\
repo=nonfree-fedora-updates-released-${::repo_fedora::releasever}&arch=\$basearch"
    $baseurl = 'absent'
  } else {
    $mirrorlist = 'absent'
    $baseurl = "${repo_fedora::rpmfusion_nonfree_updates_repourl}/\
${::repo_fedora::releasever}/${::repo_fedora::releasever}\$basearch/"
  }

  # Yumrepo ensure only in Puppet >= 3.5.0
  if versioncmp($::puppetversion, '3.5.0') >= 0 {
    Yumrepo <| title == 'rpmfusion-nonfree-updates' |>
      { ensure => $repo_fedora::ensure_rpmfusion_nonfree_updates }
  }

  yumrepo { 'rpmfusion-nonfree-updates':
    baseurl    => $baseurl,
    mirrorlist => $mirrorlist,
    descr      => 'RPM Fusion for Fedora $releasever - NonFree - Updates',
    enabled    => $enabled,
    gpgcheck   => '1',
    gpgkey     => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-nonfree-fedora-${repo_fedora::releasever}"
    #priority   => '1',
  }

}
