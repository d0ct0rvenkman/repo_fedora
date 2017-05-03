# The RPMFusion Free repository
class repo_fedora::rpmfusion_free {

  include repo_fedora

  if $repo_fedora::enable_rpmfusion_free {
    $enabled = '1'
  } else {
    $enabled = '0'
  }
  if $repo_fedora::enable_mirrorlist {
    $mirrorlist = "${repo_fedora::rpmfusion_mirrorlist}/mirrorlist?\
repo=free-fedora-${::repo_fedora::releasever}&arch=\$basearch"
    $baseurl = 'absent'
  } else {
    $mirrorlist = 'absent'
    $baseurl = "${repo_fedora::rpmfusion_free_repourl}/\
${::repo_fedora::releasever}/Everything\$basearch/os/"
  }

  # Yumrepo ensure only in Puppet >= 3.5.0
  if versioncmp($::puppetversion, '3.5.0') >= 0 {
    Yumrepo <| title == 'rpmfusion-free' |>
      { ensure => $repo_fedora::ensure_rpmfusion_free }
  }

  yumrepo { 'rpmfusion-free':
    baseurl    => $baseurl,
    mirrorlist => $mirrorlist,
    descr      => 'RPM Fusion for Fedora $releasever - Free',
    enabled    => $enabled,
    gpgcheck   => '1',
    gpgkey     => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-free-fedora-${repo_fedora::releasever}"
    #priority   => '1',
  }

}
