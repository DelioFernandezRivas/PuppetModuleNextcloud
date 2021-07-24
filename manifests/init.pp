# == Class: nextcloud
#
class nextcloudmio {
  include 'nextcloudmio::install'
  include 'nextcloudmio::mysql'
  include 'nextcloudmio::apache2'
}
