# /etc/puppet/modules/java/manifests/params.pp

class java::params {

   $java_archive = $::hostname ? {		
      default => "jdk-7u51-linux-x64.tar.gz",
   }

   $java_base_path = $::hostname ? {
      default => "/usr/lib/jvm",
   }

   $java_home = $::hostname ? {
      default => "/usr/lib/jvm/jdk1.7.0_51",
   }

   $java_folder = $::hostname ? {
      default => "jdk1.7.0_51",
   }

   $tmp_directory = $::hostname ? {
      default => "/tmp",
   }
  
   $owner = $::hostname ? {
      default => "root",
   }
}
