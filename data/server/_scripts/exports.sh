#!/bin/bash
# Base of Appian
SCRIPT_PATH="${BASH_SOURCE[0]}";                                                                                                                             
if([ -h "${SCRIPT_PATH}" ]) then                                                                                                              
  while([ -h "${SCRIPT_PATH}" ]) do SCRIPT_PATH=`readlink "${SCRIPT_PATH}"`; done                                                                                                                                        
fi                                                                                                                                            
pushd . > /dev/null                                                                                                                           
cd `dirname ${SCRIPT_PATH}` > /dev/null                                                                                                      
SCRIPT_PATH=`pwd`;                                                                                                                            
popd  > /dev/null

OS=`uname`
ARCH_TYPE=`uname -m`
export AE_HOME=`cd "${SCRIPT_PATH}/../../";pwd`
case "$OS" in
  *MINGW*|*CYGWIN*)
    export AE_HOME=`cygpath -am $AE_HOME`
  ;;
esac

# Common Configuration files for AE
# These are files common to atleast 2 of Java, UI and Arch.
export AE_CONF=$AE_HOME/conf

# AE Servers location
export AE_SVR=$AE_HOME/server
export AE_DOCS=$AE_HOME/_admin

# Variables that are used in scripts to refer to server specifics
export AE_SVRBIN=$AE_SVR/_bin
export AE_SVRCONF=$AE_SVR/_conf
export AE_SVRLIB=$AE_SVR/_lib
export AE_SVRLOG=$AE_HOME/logs
if [ ! -d $AE_SVRLOG ]
then
  mkdir $AE_SVRLOG
fi
if [ ! -d $AE_SVRLOG/perflogs ]
then
  mkdir $AE_SVRLOG/perflogs
fi
export AE_SVRSCRIPTS=$AE_SVR/_scripts

case "$OS" in
  Linux)
    if [ $ARCH_TYPE = "i686" ] || [ $ARCH_TYPE = "i586" ] || [ $ARCH_TYPE = "i486" ]
    then
    export K3HOME=$AE_SVRBIN/k/linux32
    else
    export K3HOME=$AE_SVRBIN/k/linux64
    fi
  ;;
  SunOS)
    export K3HOME=$AE_SVRBIN/k/solaris64
  ;;
  *MINGW*|*CYGWIN*)
    export K3HOME=$AE_SVRBIN/k/win64
  ;;
  AIX)
    export K3HOME=$AE_SVRBIN/k/aix64
 ;;
  *)
    echo "Unsupported OS: " $OS
    exit 1
  ;;
esac
export APPIAN_EXEC=$K3HOME/k

# 1 = view console; 0 = run console in background
export AE_SEE_CONSOLE=0
