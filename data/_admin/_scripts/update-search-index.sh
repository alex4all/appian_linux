#!/bin/bash
pushd `dirname $0` > /dev/null
TIMESTAMP_FILE=.search-timestamp

ARG1=
if [ "$1" != "-new" ]
  then
    if [ "$1" != "-update" ]
     then
      ARG1=$1
    fi
fi

FLAG=$1
if [ "$FLAG" != "-new" ]
 then
  FLAG=-update
fi

java -cp classpath.jar -Dlog4j.defaultInitOverride=true com.appiancorp.search.export.ExportDriver $FLAG $TIMESTAMP_FILE $ARG1 $2 $3 $4 $5 $6 $7 $8
popd > /dev/null