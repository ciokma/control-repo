class profile::example {

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

}
