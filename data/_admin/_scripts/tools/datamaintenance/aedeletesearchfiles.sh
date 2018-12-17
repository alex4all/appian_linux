#!/bin/bash
pushd `dirname $0` > /dev/null
. ../../../../server/_scripts/exports.sh
. ../../../../server/_scripts/exports-ant.sh
INSTALLDIR=$AE_HOME/_admin/_scripts/tools/datamaintenance/antScripts
ant -f $INSTALLDIR/aedeletesearchfiles.xml
popd > /dev/null