#!/bin/bash
pushd `dirname $0` > /dev/null
cd ..
. exports.sh
cd $AE_SVR/notifications
$APPIAN_EXEC n-create
$APPIAN_EXEC s-create
popd > /dev/null