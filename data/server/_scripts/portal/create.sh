#!/bin/bash
pushd `dirname $0` > /dev/null
cd ..
. exports.sh
cd $AE_SVR/portal
$APPIAN_EXEC ap-create
popd > /dev/null