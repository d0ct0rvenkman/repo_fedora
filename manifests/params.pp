# Optional parameters in setting up Fedora Yum repository
class repo_fedora::params {

  if $::operatingsystemrelease {
    $releasever = $::operatingsystemrelease
  }

  $enable_mirrorlist                 = true
  $repourl                           = 'http://mirror.fedoraproject.org/pub/fedora/linux/releases'
  $adobe_repourl                     = 'http://linuxdownload.adobe.com/linux/x86_64'
  $bumblebee_nonfree_repourl         = 'http://install.linux.ncsu.edu/pub/yum/itecs/public/bumblebee-nonfree/fedora'
  $bumblebee_repourl                 = 'http://install.linux.ncsu.edu/pub/yum/itecs/public/bumblebee/fedora'
  $rpmfusion_free_repourl            = 'http://download1.rpmfusion.org/free/fedora/releases'
  $rpmfusion_free_updates_repourl    = 'http://download1.rpmfusion.org/free/fedora/updates'
  $rpmfusion_nonfree_updates_repourl = 'http://download1.rpmfusion.org/nonfree/fedora/updates'
  $rpmfusion_nonfree_repourl         = 'http://download1.rpmfusion.org/nonfree/fedora/releases'
  $rpmfusion_mirrorlist              = 'http://mirrors.rpmfusion.org'
  $playonlinux_repourl               = 'http://rpm.playonlinux.com/fedora/yum/base'
  $mediaelch_repourl                 = 'https://copr-be.cloud.fedoraproject.org/results/dirkdavidis/Mediaelch/fedora'
  $spotify_repourl                   = 'http://negativo17.org/repos/spotify'
  $google_chrome_repourl             = 'http://dl.google.com/linux/chrome/rpm/stable/x86_64'
  $debug_repourl                     = 'http://download.fedoraproject.org/pub/fedora/linux'
  $source_repourl                    = 'http://download.fedoraproject.org/pub/fedora/linux'
  $mirrorlisturl                     = 'http://mirrors.fedoraproject.org'
  $enable_fedora                     = true
  $enable_updates                    = true
  $enable_updates_testing            = false
  $enable_adobe                      = false
  $enable_bumblebee_nonfree          = false
  $enable_bumblebee_nonfree_source   = false
  $enable_bumblebee                  = false
  $enable_mediaelch                  = false
  $enable_spotify                    = false
  $enable_google_chrome              = false
  $enable_playonlinux                = false
  $enable_rpmfusion_free             = false
  $enable_rpmfusion_free_updates     = false
  $enable_rpmfusion_nonfree_updates  = false
  $enable_rpmfusion_nonfree          = false
  $enable_rpmfusion_free_testing     = false
  $enable_rpmfusion_nonfree_testing  = false
  $enable_retroshare                 = false
  $ostype                            = 'Fedora'
  $ensure_fedora                     = 'present'
  $ensure_updates                    = 'present'
  $ensure_updates_testing            = 'present'
  $ensure_adobe                      = 'present'
  $ensure_bumblebee_free             = 'present'
  $ensure_bumblebee_nonfree_source   = 'present'
  #$ensure_source_free_testing       = 'present'
  $ensure_mediaelch                  = 'present'
  $ensure_google_chrome              = 'present'
  $ensure_playonlinux                = 'present'
  $ensure_rpmfusion_free             = 'present'
  $ensure_rpmfusion_nonfree          = 'present'
  $ensure_rpmfusion_free_testing     = 'present'
  $ensure_rpmfusion_nonfree_testing  = 'present'
  $ensure_retroshare                 = 'present'

  #case $releasever {
  #  '7': {
  #    $ensure_contrib          = 'absent'
  #    $ensure_scl              = 'absent'
  #    $mirrorlist_tail         = '&infra=$infra'
  #  }
  #  '6': {
  #    $ensure_contrib          = 'present'
  #    $ensure_scl              = 'present'
  #    $mirrorlist_tail         = '&infra=$infra'
  #  }
  #  '5': {
  #    $ensure_contrib          = 'present'
  #    $ensure_scl              = 'absent'
  #    $mirrorlist_tail         = ''
  #  }
  #  default: { }
  #}
}
