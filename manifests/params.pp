# Optional parameters in setting up Fedora Yum repository
class repo_fedora::params {

  #if $::operatingsystemmajrelease {
  #  $releasever = $::operatingsystemmajrelease
  #} else $::os_maj_version {
  #  $releasever = $::os_maj_version
  #}

  $enable_mirrorlist                = true
  $repourl                          = 'http://mirror.fedoraproject.org/pub/fedora/linux/releases'
  $debug_repourl                    = 'http://download.fedoraproject.org/pub/fedora/linux'
  $source_repourl                   = 'http://download.fedoraproject.org/pub/fedora/linux'
  $mirrorlisturl                    = 'http://mirrors.fedoraproject.org'
  $enable_fedora                    = true
  $enable_updates                   = false
  $enable_updates_testing           = false
  $enable_adobe                     = false
  $enable_bumblebee_nonfree         = false
  $enable_bumblebee                 = false
  $enable_mediaelch                 = false
  $enable_google_chrome             = false
  $enable_playonlinux               = false
  $enable_rpmfusion_free            = false
  $enable_rpmfusion_nonfree         = false
  $enable_rpmfusion_free_testing    = false
  $enable_rpmfusion_nonfree_testing = false
  $enable_retroshare                = false
  $ostype                           = 'Fedora'
  $ensure_fedora                    = 'present'
  $ensure_updates                   = 'present'
  $ensure_updates_testing           = 'present'
  $ensure_adobe                     = 'present'
  $ensure_bumblebee_free            = 'present'
  $ensure_bumblebee_nonfree         = 'present'
  #$ensure_source_free_testing       = 'present'
  $ensure_mediaelch                 = 'present'
  $ensure_google_chrome             = 'present'
  $ensure_playonlinux               = 'present'
  $ensure_rpmfusion_free            = 'present'
  $ensure_rpmfusion_nonfree         = 'present'
  $ensure_rpmfusion_free_testing    = 'present'
  $ensure_rpmfusion_nonfree_testing = 'present'
  $ensure_retroshare                = 'present'

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
