#!/bin/bash
pushd `dirname $0` > /dev/null
cd ..
. exports.sh
cd $AE_SVR/gateway
$APPIAN_EXEC gwvalidate $*
popd > /dev/null