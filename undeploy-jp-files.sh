#!/bin/sh
# Get the Japanese properties from GitHub.
echo "Please input OpenAM installation directory. For example, /usr/share/tomcat6/webapps/openam"
read AM_DIR

# Restore and remove backup files if exist.
rm -fr $AM_DIR/XUI/locales/ja
rm -fr $AM_DIR/policyEditor/locales/ja
rm -f $AM_DIR/WEB-INF/classes/*_ja.properties
\cp -fr $AM_DIR/config/auth/default_ja_bak/* $AM_DIR/config/auth/default_ja/
rm -f $AM_DIR/config/auth/default_ja/DeviceIdMatch.xml $AM_DIR/config/auth/default_ja/DeviceIdSave.xml
rm -fr $AM_DIR/config/auth/default_ja_bak
mv -f $AM_DIR/policyEditor/org/forgerock/openam/ui/policy/SiteConfigurationDelegate.js.bak $AM_DIR/policyEditor/org/forgerock/openam/ui/policy/SiteConfigurationDelegate.js
mv -f $AM_DIR/XUI/org/forgerock/openam/ui/common/delegates/SiteConfigurationDelegate.js.bak $AM_DIR/XUI/org/forgerock/openam/ui/common/delegates/SiteConfigurationDelegate.js
