#!/bin/bash
pushd `dirname $0` > /dev/null
. ../../../../../server/_scripts/exports.sh
. ../../../../../server/_scripts/exports-ant.sh
INSTALLDIR=$AE_HOME/_admin/_scripts/tools/datamaintenance/antScripts
ant -f $INSTALLDIR/aecopyfiles.xml -Dae.source.location=$AE_HOME -Dae.dest.location="/data/kdbbackups" -Dae.datadelete="n" -Dae.copycontents="n" -Dkdb.num="5" -Dkdb.invertselect="y" -Dbatchmode="y"
popd > /dev/null