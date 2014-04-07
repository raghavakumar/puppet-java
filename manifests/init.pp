#configure jdk

class java
  {

  require java::params

  Exec
  {
    path => [ "/usr/bin", "/bin", "/usr/sbin" ]
  }

  file { "${java::params::tmp_directory}/${java::params::java_archive}" :
         ensure => "present",
	 source => "puppet:///modules/java/${java::params::java_archive}",
	 owner => "${java::params::owner}",
	 mode => 755
       }

  exec { "extracti_jdk":
         cwd => "${java::params::tmp_directory}",
 	 command => "tar xfv ${java::params::java_archive}",
	 creates => "${java::params::java_home}",
         alias => "extract_jdk",
	 require => File["${java::params::tmp_directory}/${java::params::java_archive}"],
       }

  file { "${java::params::java_base_path}":
         ensure => directory,
	 owner => "${java::params::owner}",
	 require => Exec['extract_jdk']
       }

  exec { "move_jdk":
         cwd => "${java::params::tmp_directory}",
         creates => "${java::params::java_home}",
         require => File["${java::params::java_base_path}"],
         command => "mv ${java::params::java_folder} ${java::params::java_base_path}"
       }

  exec { "install_java":
         require   => Exec['move_jdk'],
         logoutput => true,
         command   => "update-alternatives --install /usr/bin/java java ${java::params::java_home}/bin/java 1"
       }

  exec { "set_java":
         require   => Exec['install_java'],
         logoutput => true,
         command   => "update-alternatives --set java ${java::params::java_home}/bin/java"
       }

  exec { "install_javac":
         require   => Exec['move_jdk'],
         logoutput => true,
         command   => "update-alternatives --install /usr/bin/javac javac ${java::params::java_home}/bin/javac 1"
       }

  exec { "set_javac":
         require   => Exec['install_javac'],
         logoutput => true,
         command   => "update-alternatives --set javac ${java::params::java_home}/bin/javac"
       }

  file { "/etc/profile.d/java.sh":
    content => "export JAVA_HOME=${java::params::java_home}
export PATH=\$PATH:\$JAVA_HOME/bin"
  }
}
