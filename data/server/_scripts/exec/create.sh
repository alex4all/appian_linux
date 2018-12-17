#!/bin/bash
pushd `dirname $0` > /dev/null
cd ..
. exports.sh
cd $AE_SVR/process/exec
$APPIAN_EXEC pe-create main
popd > /dev/null