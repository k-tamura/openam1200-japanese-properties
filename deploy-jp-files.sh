#!/bin/sh
# Get the deploy script.
wget --no-check-certificate https://codeload.github.com/k-tamura/openam1200-japanese-properties/zip/master  -O openam1200-japanese-properties-master.zip

# Get a OpenAM installation directory.
echo "Please input OpenAM installation directory. For example, /usr/share/tomcat6/webapps/openam"
read AM_DIR

# Remove backup files if exist.
rm -fr $AM_DIR/XUI/locales/ja/
rm -fr $AM_DIR/policyEditor/locales/ja/
rm -f $AM_DIR/XUI/locales/ja/translation.json
rm -f $AM_DIR/policyEditor/locales/ja/translation.json
rm -f $AM_DIR/WEB-INF/classes/*_ja.properties
mv $AM_DIR/config/auth/default_ja_bak $AM_DIR/config/auth/default_ja
mv $AM_DIR/policyEditor/org/forgerock/openam/ui/policy/SiteConfigurationDelegate.js.bak $AM_DIR/policyEditor/org/forgerock/openam/ui/policy/SiteConfigurationDelegate.js
mv $AM_DIR/XUI/org/forgerock/openam/ui/common/delegates/SiteConfigurationDelegate.js.bak $AM_DIR/XUI/org/forgerock/openam/ui/common/delegates/SiteConfigurationDelegate.js

# Deploy Japanese properties, xml and json files.
mkdir -p $AM_DIR/XUI/locales/ja/
mkdir -p $AM_DIR/policyEditor/locales/ja/
unzip openam1200-japanese-properties-master.zip
cp -pr $AM_DIR/config/auth/default_ja $AM_DIR/config/auth/default_ja_bak
mv $AM_DIR/policyEditor/org/forgerock/openam/ui/policy/SiteConfigurationDelegate.js $AM_DIR/policyEditor/org/forgerock/openam/ui/policy/SiteConfigurationDelegate.js.bak
mv $AM_DIR/XUI/org/forgerock/openam/ui/common/delegates/SiteConfigurationDelegate.js $AM_DIR/XUI/org/forgerock/openam/ui/common/delegates/SiteConfigurationDelegate.js.bak
cp openam1200-japanese-properties-master/openam-ui-policy/src/main/js/org/forgerock/openam/ui/policy/delegates/SiteConfigurationDelegate.js $AM_DIR/policyEditor/org/forgerock/openam/ui/policy/SiteConfigurationDelegate.js
cp openam1200-japanese-properties-master/openam-ui-ria/src/main/js/org/forgerock/openam/ui/common/delegates/SiteConfigurationDelegate.js $AM_DIR/XUI/org/forgerock/openam/ui/common/delegates/SiteConfigurationDelegate.js
cp -r openam1200-japanese-properties-master/openam-ui-ria/src/main/resources/locales/ja/translation.json $AM_DIR/XUI/locales/ja/
cp -r openam1200-japanese-properties-master/openam-ui-policy/src/main/resources/locales/ja/translation.json $AM_DIR/policyEditor/locales/ja/
cp -rf openam1200-japanese-properties-master/openam-server-only/src/main/webapp/config/auth/default_ja/* $AM_DIR/config/auth/default_ja/
find openam1200-japanese-properties-master -name '*.properties' -print | xargs cp -t $AM_DIR/WEB-INF/classes/
rm -fr openam1200-japanese-properties-master
rm openam1200-japanese-properties-master.zip
