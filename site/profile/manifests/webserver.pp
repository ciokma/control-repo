class profile::webserver
{
    # garantizar que siempre este corriendo el servicio de apache
    service { 'apache2':
    ensure => 'running',
    enable => true,
    }

}
