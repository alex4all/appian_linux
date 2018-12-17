#!/bin/bash
pushd `dirname $0` > /dev/null
cd ..; . exports.sh; popd > /dev/null
$APPIAN_EXEC $AE_SVRLIB/convert_l_to_text $1