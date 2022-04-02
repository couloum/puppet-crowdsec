# @summary Install and configure crowdsec
#
#
# @example
#   class crowdsec {
#   }
class crowdsec(
  Enum['present', 'absent']
          $ensure                         = 'present',
  Optional[String]
          $package_version                = undef,
  Optional[Enum['running', 'stopped']]
          $service_ensure                 = undef,
){

  include crowdsec::repo
  include crowdsec::package
  include crowdsec::service

}
