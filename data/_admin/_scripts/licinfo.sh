#!/bin/bash
LICINFO=licinfo.txt
pushd `dirname $0` > /dev/null
java -classpath $PWD/classpath.jar com.appiancorp.tools.LicInfo 1> $LICINFO
$PWD/../../data-server/engine/bin/q/l64/q >> $LICINFO 2>&1
popd > /dev/null
exit 0
