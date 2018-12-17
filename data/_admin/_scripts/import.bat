@echo off

rem In order to import data types or data stores, you have to make a few
rem additions to the CLASSPATH for the import script ...

rem (1) HIBERNATE CONFIG FILES
rem You must have one hibernate config file for each datasource, including
rem the primary datasource, available within the CLASSPATH. The file must 
rem include the following properties (sample values included below for a 
rem MySQL datasource):
rem
rem hibernate.connection.driver_class=com.mysql.jdbc.Driver
rem hibernate.connection.url=jdbc:mysql://localhost/SampleDB
rem hibernate.connection.useUnicode=true
rem hibernate.connection.characterEncoding=UTF-8
rem hibernate.connection.username=appian
rem hibernate.connection.password=appian
rem 
rem The file must be named hibernate.XXX.properties, where XXX is SampleDB in
rem the above example.  You put the directory name of the file into the
rem classpath, like so:
rem set HIBERNATE_PROPS=C:\Temp\Hibernate

rem (2) JDBC DRIVERS
rem You need to have JDBC drivers for your datasources.  In the example
rem above, you would need the MySQL database driver.  This driver is not
rem included with the Appian install.  The example below assumes you are
rem using MySQL.
rem Replace <version> with the actual version of your driver.
rem set JDBC_DRIVERS=%~dp0..\..\..\tomcat\apache-tomcat\lib\mysql-connector-java-<version>.jar

set IMPORT_CLASSPATH=%HIBERNATE_PROPS%;%JDBC_DRIVERS%;%~dp0classpath.jar

java -classpath %IMPORT_CLASSPATH% -Dlog4j.defaultInitOverride=true com.appiancorp.tools.ix.IxCommandLineTool "import" %*
