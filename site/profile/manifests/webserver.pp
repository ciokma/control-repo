class profile::webserver
{
    
    #class { 'stdlib': }
    #class { 'httpd': }
    service { 'apache2':
    ensure => 'running',
    enable => true,
    require => Class['apache'],
    }

}
