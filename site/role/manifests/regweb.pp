class role::regweb {
  file { 'C:/Temp/r10k.txt':
    ensure => present,
    path   => 'C:\Temp\r10k.txt'
    content => 'Hello from control repo'
  }
}
