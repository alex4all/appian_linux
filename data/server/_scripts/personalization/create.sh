#!/bin/bash
pushd `dirname $0` > /dev/null
cd ..
. exports.sh
cd $AE_SVR/personalization
$APPIAN_EXEC ag_create
popd > /dev/null