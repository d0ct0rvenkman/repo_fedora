# The Playonlinux repository
class repo_fedora::playonlinux {

  include repo_fedora

  if $repo_fedora::enable_playonlinux {
    $enabled = '1'
  } else {
    $enabled = '0'
  }
  if $repo_fedora::enable_mirrorlist {
    $mirrorlist = 'absent'
    $baseurl = $repo_fedora::playonlinux_repourl
  } else {
    $mirrorlist = 'absent'
    $baseurl = $repo_fedora::playonlinux_repourl
  }

  # Yumrepo ensure only in Puppet >= 3.5.0
  if versioncmp($::puppetversion, '3.5.0') >= 0 {
    Yumrepo <| title == 'playonlinux' |> { ensure => $repo_fedora::ensure_playonlinux }
  }

  yumrepo { 'playonlinux':
    baseurl    => $baseurl,
    mirrorlist => $mirrorlist,
    descr      => 'Adobe Systems Incorporated',
    enabled    => $enabled,
    gpgcheck   => '0',
    gpgkey     => 'http://rpm.playonlinux.com/public.gpg'
    #priority   => '1',
  }

}
