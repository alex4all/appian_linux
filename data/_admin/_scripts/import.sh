#!/bin/bash

# In order to import data types or data stores, you have to make a few
# additions to the CLASSPATH for the import script ...
#
# (1) HIBERNATE CONFIG FILES
# You must have one hibernate config file for each datasource, including
# the primary datasource, available within the CLASSPATH. The file must 
# include the following properties (sample values included below for a 
# MySQL datasource):
#
# hibernate.connection.driver_class=com.mysql.jdbc.Driver
# hibernate.connection.url=jdbc:mysql://localhost/SampleDB
# hibernate.connection.useUnicode=true
# hibernate.connection.characterEncoding=UTF-8
# hibernate.connection.username=appian
# hibernate.connection.password=appian
# 
# The file must be named hibernate.XXX.properties, where XXX is SampleDB in
# the above example.  You put the directory name of the file into the
# classpath, like so:
# HIBERNATE_PROPS=/tmp/hibernate
#
# (2) JDBC DRIVERS
# You need to have JDBC drivers for your datasources.  In the example
# above, you would need the MySQL database driver.  This driver is not
# included with the Appian install.  The example below assumes you are
# using MySQL.
# Replace <version> with the actual version of your driver.
# JDBC_DRIVERS=`dirname $0`/../../tomcat/apache-tomcat/lib/mysql-connector-java-<version>.jar

IMPORT_CLASSPATH=$HIBERNATE_PROPS:$JDBC_DRIVERS:`dirname $0`/classpath.jar
echo $IMPORT_CLASSPATH
java -cp $IMPORT_CLASSPATH -Dlog4j.defaultInitOverride=true com.appiancorp.tools.ix.IxCommandLineTool "import" $*
