# /etc/puppet/modules/java/manifests/params.pp

class java::params {

   $java_archive = $::hostname ? {		
      default => "jdk-7u51-linux-x64.tar.gz",
   }

   $java_base_path = $::hostname ? {
      default => "/usr/lib/jvm",
   }

   $download_url = $::hostname ? {
      default => "http://download.oracle.com/otn-pub/java/jdk/7u51-b13/jdk-7u51-linux-x64.tar.gz",
   }

   $java_home = $::hostname ? {
      default => "/usr/lib/jvm/jdk1.7.0_51",
   }

   $java_folder = $::hostname ? {
      default => "jdk1.7.0_51",
   }

   $tmp_directory = $::hostname ? {
      default => "/opt",
   }
  
   $owner = $::hostname ? {
      default => "root",
   }
}
