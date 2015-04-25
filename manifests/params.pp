# == Class gitbucket::params
#
# This class is meant to be called from gitbucket.
# It sets variables according to platform.
#
class gitbucket::params {
  case $::osfamily {
    'Debian', 'RedHat', 'Amazon': {
      # Module Configuration
      $package_name = 'gitbucket'
      # Server Options
      $owner        = 'gitbucket'
      $group        = 'gitbucket'
      $directory    = '/var/gitbucket'
    }
    'FreeBSD': {
      # Module Configuration
      $package_name = 'devel/gitbucket'
      # Server Options
      $owner        = 'gitbucket'
      $group        = 'gitbucket'
      $directory    = '/usr/local/gitbucket'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }

  # Module Configuration
  $package_ensure = 'present'
  $service_name   = 'gitbucket'
  $service_enable = true
  $service_ensure = 'running'

  # Server Options
  $http_listen  = undef
  $http_port    = undef
  $prefix       = '/gitbucket'
}
