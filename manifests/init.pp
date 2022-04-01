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
){

  include crowdsec::repo
  include crowdsec::package


}
