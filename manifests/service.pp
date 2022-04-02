# @summary Mange crowdsec service
#
# @private
class crowdsec::service {

  $service_ensure = pick($::crowdsec::service_ensure, $::crowdsec::ensure)

  service { 'crowdsec':
    ensure => $service_ensure,
  }
}
