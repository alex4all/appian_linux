#!/bin/bash -f
pushd `dirname $0` > /dev/null
cd ..
. exports.sh
cd $AE_SVR/tools

ARGS=$*

sub_help() {
  $APPIAN_EXEC archiveprocess --help
}

sub_call() {
   $APPIAN_EXEC archiveprocess $ARGS
}

while (("$#")); do
  case "$1" in
    '-h')
      sub_help
      popd > /dev/null
      exit 0
      ;;
    '-i')
      sub_help
      popd > /dev/null
      exit 0
      ;;
    '-p')
      sub_help
      popd > /dev/null
      exit 0
      ;;
  esac
  shift
done

sub_call
popd > /dev/null
