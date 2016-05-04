# The Mediaelch repository - Managing Movies for Kodi
class repo_fedora::spotify {

  include repo_fedora
  $baseurl = "${repo_fedora::spotify_repourl}-\
fedora-${repo_fedora::releasever}/\$basearch"

  if $repo_fedora::enable_spotify {
    $enabled = '1'
  } else {
    $enabled = '0'
  }

  # Yumrepo ensure only in Puppet >= 3.5.0
  if versioncmp($::puppetversion, '3.5.0') >= 0 {
    Yumrepo <| title == 'spotify' |>
      { ensure => $repo_fedora::ensure_spotify }
  }

  yumrepo { 'spotify':
    baseurl    => $baseurl,
    mirrorlist => $mirrorlist,
    descr      => 'negativo17 - Spotify',
    enabled    => $enabled,
    gpgcheck   => '0',
    gpgkey     => 'http://negativo17.org/repos/RPM-GPG-KEY-slaanesh'
    #priority   => '1',
  }

}
