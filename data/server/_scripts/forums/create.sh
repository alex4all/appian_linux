#!/bin/bash
pushd `dirname $0` > /dev/null
cd ..
. exports.sh
cd $AE_SVR/forums
$APPIAN_EXEC afcreate
popd > /dev/null