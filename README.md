puppet-java
===========

Overview:

Puppet Module for managing Oracle JDK installations on Centos x86_64 machines/nodes.


Usage:

include jdk


Configuration:

"$download_url" param in "params.pp" was configured to fetch "jdk1.7.0_51" JDK version from oracle.com site. If required, Please modify the url to required version.

If above $download_url modified, then below 3 variables to be modified accordingly.

$java_archive
$java_home
$java_folder


Support:

Please create bug reports and feature requests in GitHub issues.

