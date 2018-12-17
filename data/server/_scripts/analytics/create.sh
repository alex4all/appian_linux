#!/bin/bash
pushd `dirname $0` > /dev/null
cd ..
. exports.sh
cd $AE_SVR/process/analytics
$APPIAN_EXEC pa-create main
popd > /dev/null
