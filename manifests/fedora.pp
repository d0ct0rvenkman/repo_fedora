# Base includes the Fedora Everything files from the initial release
class repo_fedora::fedora {

  include ::repo_fedora

  if $repo_fedora::enable_fedora {
    $enabled = '1'
  } else {
    $enabled = '0'
  }
  if $repo_fedora::enable_mirrorlist {
    $mirrorlist = "${repo_fedora::mirrorlisturl}/metalink?repo=fedora-${::repo_fedora::releasever}&arch=\$basearch"
    $baseurl = 'absent'
  } else {
    $mirrorlist = 'absent'
    $baseurl = "${repo_fedora::repourl}/\$releasever/Everything/\$basearch/os/"
  }

  # Yumrepo ensure only in Puppet >= 3.5.0
  if versioncmp($::puppetversion, '3.5.0') >= 0 {
    Yumrepo <| title == 'fedora' |> { ensure => $repo_fedora::ensure_fedora }
  }

  yumrepo { 'fedora':
    baseurl    => $baseurl,
    mirrorlist => $mirrorlist,
    descr      => 'Fedora $releasever - $basearch',
    enabled    => $enabled,
    gpgcheck   => '1',
    gpgkey     => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-${::repo_fedora::releasever}-\$basearch",
    #priority   => '1',
  }

}
