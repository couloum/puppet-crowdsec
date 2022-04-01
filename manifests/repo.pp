# @summary Configure crowdsec repository
#
# @private
#
class crowdsec::repo{

  $ensure = $::crowdsec::ensure

  # Add GPG key for repo
  exec{ 'Add crowdsec repo GPG key':
    user    => 'root',
    path    => ['/bin', '/sbin', '/usr/bin', '/usr/sbin'],
    command => 'curl -fsSL https://packagecloud.io/crowdsec/crowdsec/gpgkey | gpg --dearmor > /usr/share/keyrings/crowdsec_crowdsec-archive-keyring.gpg',
    creates => '/usr/share/keyrings/crowdsec_crowdsec-archive-keyring.gpg',
  }

  #Add repo
  apt::source { 'crowdsec':
    ensure   => $ensure,
    comment  => 'This is the iWeb Debian unstable mirror',
    location => sprintf('https://packagecloud.io/crowdsec/crowdsec/%s', downcase($::facts['os']['name'])),
    release  => downcase($::facts['os']['distro']['codename']),
    repos    => 'main',
    keyring  => '/usr/share/keyrings/crowdsec_crowdsec-archive-keyring.gpg',
  }

  exec{ 'reload apt for crowdec':
    user        => 'root',
    path        => ['/bin', '/sbin', '/usr/bin', '/usr/sbin'],
    command     => 'apt-get update',
    refreshonly => true,
    subscribe   => Apt::Source['crowdsec'],
  }

}
