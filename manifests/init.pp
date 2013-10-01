class hipchat( $ensure = 'present' ) {

  # Only support Ubuntu at the moment
  if $::osfamily == 'Debian'{
		include apt
    apt::source{ 'hipchat':
      location    => 'http://downloads.hipchat.com/linux/apt',
      release     => 'stable',
      repos       => 'main',
      include_src => false,
    }
    
    apt::key { 'hipchat':
      key_source => 'https://www.hipchat.com/keys/hipchat-linux.key',
    }
    
    package{ 'hipchat':
      ensure => $ensure,
    }
  }
  
  Apt::Source['hipchat'] -> Apt::Key['hipchat'] -> Package['hipchat']
}
