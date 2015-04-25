# == Class gitbucket::service
#
# This class is meant to be called from gitbucket.
# It ensure the service is running.
#
class gitbucket::service {
  service { $::gitbucket::service_name:
    ensure     => $::gitbucket::service_ensure,
    enable     => $::gitbucket::service_enable,
    hasstatus  => true,
    hasrestart => true,
  }
}
