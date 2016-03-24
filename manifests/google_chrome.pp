# The Google Chrome repository
class repo_fedora::google_chrome {

  include repo_fedora

  if $repo_fedora::enable_google_chrome {
    $enabled = '1'
  } else {
    $enabled = '0'
  }
  if $repo_fedora::enable_mirrorlist {
    $mirrorlist = 'absent'
    $baseurl = $repo_fedora::google_chrome_repourl
  } else {
    $mirrorlist = 'absent'
    $baseurl = $repo_fedora::google_chrome_repourl
  }

  # Yumrepo ensure only in Puppet >= 3.5.0
  if versioncmp($::puppetversion, '3.5.0') >= 0 {
    Yumrepo <| title == 'google-chrome' |> { ensure => $repo_fedora::ensure_google_chrome}
  }

  yumrepo { 'google-chrome':
    baseurl    => $baseurl,
    mirrorlist => $mirrorlist,
    descr      => 'google-chrome',
    enabled    => $enabled,
    gpgcheck   => '0',
    gpgkey     => 'https://dl.google.com/linux/linux_signing_key.pub',
    #priority   => '1',
  }

}
