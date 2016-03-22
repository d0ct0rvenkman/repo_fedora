# The Fedora Updates repository
class repo_fedora::bumblebee_nonfree {

  include repo_fedora

  if $repo_fedora::enable_bumblebee_nonfree {
    $enabled = '1'
  } else {
    $enabled = '0'
  }
  if $repo_fedora::enable_mirrorlist {
    $mirrorlist = 'absent'
    $baseurl = "${repo_fedora::bumblebee_nonfree_repourl}${repo_fedora::releasever}"
  } else {
    $mirrorlist = 'absent'
    $baseurl = "${repo_fedora::bumblebee_nonfree_repourl}${repo_fedora::releasever}"
  }

  # Yumrepo ensure only in Puppet >= 3.5.0
  if versioncmp($::puppetversion, '3.5.0') >= 0 {
    Yumrepo <| title == 'adobe-linux' |> { ensure => $repo_fedora::ensure_bumblebee_nonfree }
  }

  yumrepo { 'bumblebee-nonfree':
    baseurl    => $baseurl,
    mirrorlist => $mirrorlist,
    descr      => 'bumblebee nonfree for fedora Linux $releasever - $basearch - Base',
    enabled    => $enabled,
    gpgcheck   => '0',
    gpgkey     => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-bumblebee-nonfree-public"
    #priority   => '1',
  }

}
