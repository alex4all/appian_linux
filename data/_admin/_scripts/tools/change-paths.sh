#!/bin/bash
OLD_PATH_MSG=/appian/server/msg
OLD_PATH_MWS=/appian/_admin/mini
OLD_PATH_NOTES=/appian/_admin/process_notes
OLD_PATH_ARCHIVED=/appian/server/archived-process
NEW_PATH_MSG=/appian_new/server/msg/
NEW_PATH_MWS=/appian_new/_admin/mini
NEW_PATH_NOTES=/appian_new/_admin/process_notes
NEW_PATH_ARCHIVED=/appian_new/server/archived-process

pushd ..
java -cp classpath.jar com.appiancorp.tools.ChangePaths MWS $OLD_PATH_MWS $NEW_PATH_MWS
java -cp classpath.jar com.appiancorp.tools.ChangePaths FORUMS $OLD_PATH_MSG $NEW_PATH_MSG
java -cp classpath.jar com.appiancorp.tools.ChangePaths NOTES $OLD_PATH_NOTES $NEW_PATH_NOTES
java -cp classpath.jar com.appiancorp.tools.ChangePaths ARCHIVED $OLD_PATH_ARCHIVED $NEW_PATH_ARCHIVED
popd