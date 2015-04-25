# == Class gitbucket::install
#
# This class is called from gitbucket for install.
#
class gitbucket::install {
  package { $::gitbucket::package_name:
    ensure => $::gitbucket::package_package_ensure,
  }
}
