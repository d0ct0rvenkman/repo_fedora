# The Mediaelch repository - Managing Movies for Kodi
class repo_fedora::mediaelch {

  include repo_fedora

  if $repo_fedora::enable_mediaelch {
    $enabled = '1'
  } else {
    $enabled = '0'
  }
  if $repo_fedora::enable_mirrorlist {
    $mirrorlist = 'absent'
    $baseurl = "${repo_fedora::mediaelch_repourl}-${::repo_fedora::releasever}-\$basearch"
  } else {
    $mirrorlist = 'absent'
    $baseurl = "${repo_fedora::mediaelch_repourl}-${::repo_fedora::releasever}-\$basearch"
  }

  # Yumrepo ensure only in Puppet >= 3.5.0
  if versioncmp($::puppetversion, '3.5.0') >= 0 {
    Yumrepo <| title == 'mediaelch' |> { ensure => $repo_fedora::ensure_mediaelch }
  }

  yumrepo { 'mediaelch':
    baseurl    => $baseurl,
    mirrorlist => $mirrorlist,
    descr      => 'Copr repo for Mediaelch owned by dirkdavidis',
    enabled    => $enabled,
    gpgcheck   => '0',
    gpgkey     => 'https://copr-be.cloud.fedoraproject.org/results/dirkdavidis/Mediaelch/pubkey.gpg'
    #priority   => '1',
  }

}
