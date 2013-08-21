# == Class: flapjack
#
# This module installs and configures flapjack from the flapjack-omnibus package.
# See http://flapjack.io/ for more information on flapjack.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if it
#   has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should not be used in preference to class parameters  as of
#   Puppet 2.6.)
#
# === Examples
#
#  class { flapjack:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ]
#  }
#
# === Authors
#
# Jesse Reynolds (@jessereynolds)
#
# === Copyright
#
# Copyright 2013 Jesse Reynolds
#

class flapjack {

  package {'flapjack':
    ensure => $version,
    before => File['/etc/flapjack/flapjack_config.yml'],
  }

  file {'/etc/flapjack/flapjack_config.yml':
    ensure  => file,
    owner   => 'flapjack',
    #content => template('flapjack/flapjack_config.yml.erb'),
    content => "foo",
  }

  service {'flapjack':
    ensure    => running,
    enable    => true,
    subscribe => File['/etc/flapjack/flapjack_config.yml'],
  }

}

