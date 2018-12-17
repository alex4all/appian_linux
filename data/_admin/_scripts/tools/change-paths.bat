set OLD_PATH_MSG=c:/appian/server/msg
set OLD_PATH_MWS=c:/mini
set OLD_PATH_NOTES=c:/process_notes
set OLD_PATH_ARCHIVED=c:/appian/server/archived-process
set NEW_PATH_MSG=c:/appian_new/server/msg
set NEW_PATH_MWS=c:/appian_new/_admin/mini
set NEW_PATH_NOTES=c:/appian_new/_admin/process_notes
set NEW_PATH_ARCHIVED=c:/appian_new/server/archived-process

pushd ..
java -cp classpath.jar com.appiancorp.tools.ChangePaths MWS %OLD_PATH_MWS% %NEW_PATH_MWS%
java -cp classpath.jar com.appiancorp.tools.ChangePaths FORUMS %OLD_PATH_MSG% %NEW_PATH_MSG%
java -cp classpath.jar com.appiancorp.tools.ChangePaths NOTES %OLD_PATH_NOTES% %NEW_PATH_NOTES%
java -cp classpath.jar com.appiancorp.tools.ChangePaths ARCHIVED %OLD_PATH_ARCHIVED% %NEW_PATH_ARCHIVED%
popd
pause
