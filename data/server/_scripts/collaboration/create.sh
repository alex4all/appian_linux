#!/bin/bash
pushd `dirname $0` > /dev/null
cd ..
. exports.sh
cd $AE_SVR/collaboration
$APPIAN_EXEC dcinit
$APPIAN_EXEC statinit
popd > /dev/null