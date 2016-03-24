# The Adobe repository
class repo_fedora::adobe {

  include repo_fedora

  if $repo_fedora::enable_adobe {
    $enabled = '1'
  } else {
    $enabled = '0'
  }
  if $repo_fedora::enable_mirrorlist {
    $mirrorlist = 'absent'
    $baseurl = $repo_fedora::adobe_repourl
  } else {
    $mirrorlist = 'absent'
    $baseurl = $repo_fedora::adobe_repourl
  }

  # Yumrepo ensure only in Puppet >= 3.5.0
  if versioncmp($::puppetversion, '3.5.0') >= 0 {
    Yumrepo <| title == 'adobe-linux' |> { ensure => $repo_fedora::ensure_adobe }
  }

  yumrepo { 'adobe-linux':
    baseurl    => $baseurl,
    mirrorlist => $mirrorlist,
    descr      => 'Adobe Systems Incorporated',
    enabled    => $enabled,
    gpgcheck   => '0',
    gpgkey     => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-adobe-linux'
    #priority   => '1',
  }

}
