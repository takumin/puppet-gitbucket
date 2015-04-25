# == Class gitbucket::config
#
# This class is called from gitbucket for service config.
#
class gitbucket::config {
  file { $::gitbucket::directory:
    ensure  => directory,
    owner   => $::gitbucket::owner,
    group   => $::gitbucket::group,
    mode    => '0755',
  }

  if $operatingsystem == 'freebsd' {
    file { '/etc/rc.conf.d/gitbucket':
      ensure  => file,
      owner   => 'root',
      group   => 'wheel',
      mode    => '0644',
      content => template('gitbucket/rc.conf.erb'),
    }
  }
}
