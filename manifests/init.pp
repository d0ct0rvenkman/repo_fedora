# == Class: repo_fedora
#
# Configure the Fedora repositories and import GPG keys
# It is tested on Fedora 23 only. My goal is it to support Version 22, 23 and future releases
#
# === Parameters:
#
# $enable_mirrorlist::             Enables the yumrepo mirrorlist parameter and
#                                  disables the baseurl
#                                  type:boolean
#
# $repourl::                       The base repo URL, if not specified defaults to the
#                                  Fedora Mirror
#
# $mirrorlisturl::                 The mirrorlist repo URL, if not specified
#                                  defaults to the Fedora Mirror
#
# $enable_base::                   Enable the Fedora Base Repo
#                                  type:boolean
#
# $enable_contrib::                Enable the Fedora User Contrib Repo
#                                  type:boolean
#
# $enable_cr::                     Enable the Fedora Continuous Release Repo
#                                  type:boolean
#
# $enable_extras::                 Enable the Fedora Extras Repo
#                                  type:boolean
#
# $enable_plus::                   Enable the Fedora Plus Repo
#                                  type:boolean
#
# $enable_scl::                    Enable the Fedora SCL Repo
#                                  type:boolean
#
# $enable_updates::                Enable the Fedora Updates Repo
#                                  type:boolean
#
# === Usage:
# * Simple usage:
#
#  include repo_fedora
#
# * Advanced usage:
#
#   class {'repo_fedora':
#     repourl       => 'http://myrepo/fedora',
#     enable_scl    => true,
#   }
#

class repo_fedora (
    $enable_mirrorlist                = $repo_fedora::params::enable_mirrorlist,
    $repourl                          = $repo_fedora::params::repourl,
    #$debug_repourl                    = $repo_fedora::params::debug_repourl,
    $source_repourl                   = $repo_fedora::params::source_repourl,
    $mirrorlisturl                    = $repo_fedora::params::mirrorlisturl,
    $enable_fedora                    = $repo_fedora::params::enable_fedora,
    $enable_updates                   = $repo_fedora::params::enable_updates,
    $enable_updates_testing           = $repo_fedora::params::enable_updates_testing,
    $enable_adobe                     = $repo_fedora::params::enable_adobe,
    #$enable_bumblebee_nonfree         = $repo_fedora::params::enable_bumblebee_nonfree,
    #$enable_bumblebee                 = $repo_fedora::params::enable_bumblebee,
    #$enable_mediaelch                 = $repo_fedora::params::enable_mediaelch,
    #$enable_google_chrome             = $repo_fedora::params::enable_google_chrome,
    #$enable_playonlinux               = $repo_fedora::params::enable_playonlinux,
    #$enable_rpmfusion_free            = $repo_fedora::params::enable_rpmfusion_free,
    #$ensure_rpmfusion_nonfree         = $repo_fedora::params::ensure_rpmfusion_nonfree,
    #$enable_rpmfusion_free_testing    = $repo_fedora::params::enable_rpmfusion_free_testing,
    #$ensure_rpmfusion_nonfree_testing = $repo_fedora::params::ensure_rpmfusion_nonfree_testing,
    #$ensure_retroshare                = $repo_fedora::params::ensure_retroshare,
  ) inherits repo_fedora::params {

  #validate_bool($enable_mirrorlist)
  #validate_string($repourl)
  #validate_string($debug_repourl)
  #validate_string($source_repourl)
  #validate_string($mirrorlisturl)
  #validate_bool($enable_fedora)
  #validate_bool($enable_updates)

  if $::operatingsystem == 'Fedora' {
    $releasever = $repo_fedora::params::releasever

    stage { 'repo_fedora_clean':
      before  => Stage['main'],
    }

    class { 'repo_fedora::clean':
      stage => repo_fedora_clean,
    }
  }

  include repo_fedora::fedora
  include repo_fedora::updates
  include repo_fedora::updates_testing
  #include repo_fedora::extras
  #include repo_fedora::plus
  #include repo_fedora::scl
  #include repo_fedora::updates
  #include repo_fedora::fasttrack
  #include repo_fedora::source
  #include repo_fedora::debug

  #Package<| |>

}
