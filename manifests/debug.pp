# Fedora debuginfo - Debuginfo packages
# This repository is shipped with Fedora and is disabled by default
class repo_fedora::debug {

  include repo_fedora

  if $repo_fedora::enable_debug {
    $enabled = '1'
  } else {
    $enabled = '0'
  }

  if $repo_fedora::releasever = '23' {
    $_gpgkey = "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-${repo_fedora::releasever}-\$basearch"
  }

  # Yumrepo ensure only in Puppet >= 3.5.0
  if versioncmp($::puppetversion, '3.5.0') >= 0 {
    Yumrepo <| title == 'fedora-debuginfo' |> { ensure => $repo_fedora::ensure_debug }
    Yumrepo <| title == 'updates-debuginfo' |> { ensure => $repo_fedora::ensure_debug }
  }

  yumrepo { 'fedora-debuginfo':
    baseurl  => "${repo_fedora::debug_repourl}/releases/${repo_fedora::releasever}/Everything/\$basearch/debug/",
    descr    => "Fedora ${repo_fedora::releasever} - $basearch - Debug",
    enabled  => $enabled,
    gpgcheck => '1',
    gpgkey   => $_gpgkey,
  }

  yumrepo { 'updates-debuginfo':
    baseurl  => "${repo_fedora::debug_repourl}/updates/${repo_fedora::releasever}/\$basearch/debug/",
    descr    => "Fedora ${repo_fedora::releasever} - $basearch - Updates - Debug",
    enabled  => $enabled,
    gpgcheck => '1',
    gpgkey   => $_gpgkey,
  }


