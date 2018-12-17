#!/bin/bash
pushd `dirname $0` > /dev/null
cd ..
. exports.sh
cd $AE_SVR/process/design
$APPIAN_EXEC pd-create main
popd > /dev/null