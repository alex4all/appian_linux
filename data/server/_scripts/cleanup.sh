#!/bin/bash
pushd `dirname $0` > /dev/null
. exports.sh
. exports-ant.sh
cd ant

#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#
#
# 
#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#
#

#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#
#
# Main code
#
#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#
#
#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#
#
# Variable initialization
#
#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#

CA=0
CK=0
CL=0
D=0
KEEP=0
BKUPPATH="/toberplaced"


CMDNAME=`basename $0`
#
USAGE="Usage: cleanup ${CMDNAME} [action] [options] [arguments]

 Description: run this script periodically to clean up old items on disk to preserve free space.  
 The script either moves or deletes old log files, process archives, and data files based on 
 the options specified in the parameters.

 Actions:

   logs: cleans up old log files
   data: cleans up old data files
   processes: cleans up old archived processes
   help: displays this screen

 Options:

   -target: specify the full or relative path to back up cleaned-up files to.

   -keep: specify the number of existing files to keep. For data files and log files, provide an integer specifying the number of files to keep. For process archives, provide an integer specifying the number of days of archives to keep.

   -delete: specify if files should be deleted instead of moved.

 Examples:

  cleanup processes -target /home/user/BKUP20/ap/ -keep 100
  Will move archived process files older than 100 days to /home/user/BKUP20/ap/ 

  cleanup data -delete -keep 10
  Will keep the 10 most recent data files and delete older ones

  cleanup logs -target /home/user/BKUP20/logs/ -keep 3
  Will keep the 3 most recent log files of each type and move all others to /home/user/BKUP20/logs 
"
#
#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#
#
# Parse options
#
#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#
#

if [ "$1" == "-h" ] ; then

 echo -e "${USAGE}\n"
 exit 1

 elif [ "$1" == "-H" ]; then

 echo -e "${USAGE}\n"
 exit 1

 elif [ "$1" == "-help" ]; then

 echo -e "${USAGE}\n"
 exit 1

 elif [ "$1" == "--help" ]; then

 echo -e "${USAGE}\n"
 exit 1

 elif [ "$1" == "-?" ]; then

 echo -e "${USAGE}\n"
 exit 1

 elif [ "$1" == "" ]; then

 echo -e "${USAGE}\n"
 exit 1

 elif [ "$1" == "processes" ]; then
 CA=1
 
 elif [ "$1" == "data" ]; then
 CK=1

 elif [ "$1" == "logs" ]; then
 CL=1


fi


# re-align the positional parameters as $1, $2,...
shift 1
#

# If no further arguments are available, echo help and exit
if [ $# -eq 0 ] ; then
 echo -e "${USAGE}\n"
 exit 3
fi


while [ $# -gt 0 ]; do

if [ $1 == "-target" ] ; then

	BKUPPATH=$2

 elif [ $1 == "-keep" ]; then

	KEEP=$2

 elif [ $1 == "-delete" ]; then

	D=1

fi

shift 1

done


if [ $CL -eq 1 ]; then


 if [ $D -ne 1 ]; then
  ant -f logs.xml -Ddir="$AE_SVRLOG" -Dlog.numkeep="$KEEP" -Dlog.bkupdir="$BKUPPATH"
 elif [ $D -eq 1 ]; then
 ant -f logs.xml -Ddir="$AE_SVRLOG"  -Dlog.numkeep="$KEEP" -Dlog.del="y" 

 fi
 exit 1

elif [ $CA -eq 1 ]; then

 if [ $D -ne 1 ]; then

  ant -f ap.xml -Dap.xmldir="$AE_SVRCONF" -Dsvr.root="$AE_SVR" -Dap.del="n" -Dap.daystokeep="$KEEP" -Dap.bkupdir="$BKUPPATH"
 elif [ $D -eq 1 ]; then
 ant -f ap.xml -Dap.xmldir="$AE_SVRCONF" -Dsvr.root="$AE_SVR" -Dap.del="y"  -Dap.daystokeep="$KEEP"
 fi
 exit 1

elif [ $CK -eq 1 ]; then

 if [ $D -ne 1 ]; then
   ant -f aemovefiles.xml -Dae.source.location="$AE_HOME"  -Dbatchmode="y" -Dkdb.invertselect="y" -Dae.copycontents="n" -Dkdb.num="$KEEP" -Dkdb.bkupdir="$BKUPPATH"

 elif [ $D -eq 1 ]; then
 ant -f aedeletefiles.xml -Dae.source.location="$AE_HOME" -Dbatchmode="y" -Dkdb.invertselect="y"  -Dkdb.num="$KEEP"

 fi
 exit 1

fi

popd > /dev/null