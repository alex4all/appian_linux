#!/bin/bash
pushd `dirname $0` > /dev/null
./update-search-index.sh -new $1 $2 $3 $4 $5 $6 $7
popd > /dev/null