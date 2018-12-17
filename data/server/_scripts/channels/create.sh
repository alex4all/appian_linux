#!/bin/bash
pushd `dirname $0` > /dev/null
cd ..
. exports.sh
cd $AE_SVR/channels
$APPIAN_EXEC channels-create
popd > /dev/null