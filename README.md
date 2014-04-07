puppet-java
===========

Overview:

Puppet Module for managing Oracle JDK installations on Centos x86_64 machines/nodes.


Usage:

include jdk


Configuration:

A tar.gz file needs to be placed into ~/modules/java/files.

Once downloaded the params.pp file needs to be updated with the version downloaded.

For ex: "params.pp" file was tested with "jdk-7u51-linux-x64.tar.gz". This tar.gz was downloaded manually from "http://www.oracle.com/technetwork/java/javase/downloads/jdk7-downloads-1880260.html" and placed in "files" subfolder.


Support:

Please create bug reports and feature requests in GitHub issues.

