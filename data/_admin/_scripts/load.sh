#!/bin/bash
pushd `dirname $0` > /dev/null
OLDDIR=$PWD
JAVA_CMD=java
if [ -n "${JAVA_HOME}" ]; then
  JAVA_CMD="${JAVA_HOME}/bin/java"
fi

cd ../../deployment/web.war
$JAVA_CMD -classpath $OLDDIR/classpath.jar -Dlog4j.defaultInitOverride=true com.appiancorp.common.initialize.InitializeServer WEB-INF/conf/dataload/config.xml
popd > /dev/null
