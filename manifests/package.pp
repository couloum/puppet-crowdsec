# @summary Install crowdsec package
#
# @private
class crowdsec::package{

  $ensure = $::crowdsec::ensure
  $package_version = $::crowdsec::package_version

  $_ensure = $ensure ? {
    'present' => pick($package_version, $ensure),
    default   =>  $ensure,
  }

  package{ 'crowdsec':
    ensure => $_ensure,
  }
}
