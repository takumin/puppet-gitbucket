# == Class: gitbucket
#
# Full description of class gitbucket here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class gitbucket (
  $package_name   = $::gitbucket::params::package_name,
  $package_ensure = $::gitbucket::params::package_ensure,
  $service_name   = $::gitbucket::params::service_name,
  $service_enable = $::gitbucket::params::service_enable,
  $service_ensure = $::gitbucket::params::service_ensure,
  $directory      = $::gitbucket::params::directory,
  $owner          = $::gitbucket::params::owner,
  $group          = $::gitbucket::params::group,
  $http_listen    = $::gitbucket::params::http_listen,
  $http_port      = $::gitbucket::params::http_port,
  $prefix         = $::gitbucket::params::prefix,
) inherits ::gitbucket::params {

  # validate parameters here

  class { '::gitbucket::install': } ->
  class { '::gitbucket::config': } ~>
  class { '::gitbucket::service': } ->
  Class['::gitbucket']
}
