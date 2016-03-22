# The Fedora Updates repository
class repo_fedora::rpmfusion_nonfree {

  include repo_fedora

  if $repo_fedora::enable_rpmfusion_nonfree {
    $enabled = '1'
  } else {
    $enabled = '0'
  }
  if $repo_fedora::enable_mirrorlist {
    $mirrorlist = "${repo_fedora::rpmfusion_mirrorlist}/mirrorlist?repo=nonfree-fedora-${::repo_fedora::releasever}&arch=\$basearch"
    $baseurl = 'absent'
  } else {
    $mirrorlist = 'absent'
    $baseurl = "${repo_fedora::rpmfusion_nonfree_repourl}/${::repo_fedora::releasever}/Everything/\$basearch/os/"
  }

  # Yumrepo ensure only in Puppet >= 3.5.0
  if versioncmp($::puppetversion, '3.5.0') >= 0 {
    Yumrepo <| title == 'rpmfusion-nonfree' |> { ensure => $repo_fedora::ensure_rpmfusion_nonfree }
  }

  yumrepo { 'rpmfusion-nonfree':
    baseurl    => $baseurl,
    mirrorlist => $mirrorlist,
    descr      => 'RPM Fusion for Fedora $releasever - Nonfree',
    enabled    => $enabled,
    gpgcheck   => '1',
    gpgkey     => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-nonfree-fedora-${repo_fedora::releasever}",
    #priority   => '1',
  }

}
