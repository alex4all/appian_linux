#!/bin/bash
pushd `dirname $0` > /dev/null

java -cp ../classpath.jar -Dlog4j.defaultInitOverride=true com.appiancorp.ag.namechange.UsernameChangeScript "$@"
popd > /dev/null
