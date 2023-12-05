class role::example {

    # MiArchivoPuppet.pp

    # Define la ruta de la carpeta que deseas crear
    $carpeta_a_crear = '/var/tmp/creada-desde-puppet'

    # Crea la carpeta utilizando el recurso file
    file { $carpeta_a_crear:
    ensure => directory,  # Asegura que es un directorio
    mode   => '0755',     # Permisos para la carpeta
    owner  => 'ubuntu',  # Propietario de la carpeta
    group  => 'grupo',    # Grupo de la carpeta
    }

}
