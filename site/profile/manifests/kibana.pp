class profile::kibana {

    # MiArchivoPuppet.pp

    # Define la ruta de la carpeta que deseas crear
    $carpeta_a_crear = '/var/tmp/creada-desde-puppet'

    # Crea la carpeta utilizando el recurso file
    file { $carpeta_a_crear:
    ensure => directory,  # Asegura que es un directorio
    mode   => '0755',     # Permisos para la carpeta
    owner  => 'ubuntu',  # Propietario de la carpeta
    group  => 'ubuntu',    # Grupo de la carpeta
    }

    # Define la ruta del archivo que deseas crear
    $archivo_a_crear = '/var/tmp/creada-desde-puppet/archivo.txt'

    # Define el contenido del archivo
    $contenido_del_archivo = 'Soy creado desde puppet via r10k'

    # Crea el archivo con el contenido utilizando el recurso file
    file { $archivo_a_crear:
    ensure  => file,            # Asegura que es un archivo
    content => $contenido_del_archivo,  # Establece el contenido del archivo
    mode    => '0644',          # Permisos para el archivo
    owner   => 'ubuntu',       # Propietario del archivo
    group   => 'ubuntu',         # Grupo del archivo
    }

    class { 'elastic_stack::repo':
        version => 5,
        oss => true,
    }   
    #incluir kibana

    # Configuraciones específicas de Kibana
    class { 'kibana':
        ensure => latest,
        config => {
            'server.port' => '8080',
        },
        oss => true,
        # Agrega más configuraciones según tus necesidades
    }

    # Puedes gestionar archivos de configuración de Kibana
    /*
    file { '/etc/kibana/kibana.yml':
        ensure  => file,
        owner   => 'kibana',
        group   => 'kibana',
        mode    => '0644',
        content => template('site/kibana/kibana.yml.erb'), # Puedes usar un template si es necesario
        notify  => Class['kibana::service'],
    }
    */
    # Puedes manejar servicios también
    service { 'kibana':
        ensure     => running,
        enable     => true
    }

    
}
