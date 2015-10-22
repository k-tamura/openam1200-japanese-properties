# openam1200-japanese-properties
OpenAM 12.0.0 Japanese properties

How to build
------
1.    Click the "Download ZIP" button to download openam1200-japanese-properties-master.zip.
2.    Execute the commands:
```bash
unzip openam1200-japanese-properties-master.zip
rm openam1200-japanese-properties-master/README.*
rm openam1200-japanese-properties-master/deploy-jp-files.sh
svn co https://svn.forgerock.org/openam/tags/12.0.0/openam/
cp -r openam1200-japanese-properties-master/* openam/
rm -fr openam1200-japanese-properties-master
cd openam
export MAVEN_OPTS="-Xmx1024m -XX:MaxPermSize=512m"
mvn -DskipTests=true clean install
```

How to deploy without build
------
If you do not want to build, you can deploy all files.

1.    Execute the commands (if using Tomcat 6):
```bash
wget --no-check-certificate https://raw.githubusercontent.com/k-tamura/openam1200-japanese-properties/master/deploy-jp-files.sh
chmod +x deploy-jp-files.sh
./deploy-jp-files.sh
service tomcat6 restart
```
Or

1.    Click the "Download ZIP" button to download openam1200-japanese-properties-master.zip.
2.    Execute the commands (if using Tomcat 6):
```bash
export AM_DIR=/usr/share/tomcat6/webapps/openam
mkdir $AM_DIR/XUI/locales/ja/
mkdir $AM_DIR/policyEditor/locales/ja/
unzip openam1200-japanese-properties-master.zip
cd openam1200-japanese-properties-master
mv $AM_DIR/policyEditor/org/forgerock/openam/ui/policy/SiteConfigurationDelegate.js.bak $AM_DIR/policyEditor/org/forgerock/openam/ui/policy/SiteConfigurationDelegate.js
mv $AM_DIR/XUI/org/forgerock/openam/ui/common/delegates/SiteConfigurationDelegate.js.bak $AM_DIR/XUI/org/forgerock/openam/ui/common/delegates/SiteConfigurationDelegate.js
cp openam-ui-policy/src/main/js/org/forgerock/openam/ui/policy/delegates/SiteConfigurationDelegate.js $AM_DIR/policyEditor/org/forgerock/openam/ui/policy/
cp openam-ui-ria/src/main/js/org/forgerock/openam/ui/common/delegates/SiteConfigurationDelegate.js $AM_DIR/XUI/org/forgerock/openam/ui/common/delegates/
cp -r openam-ui-ria/src/main/resources/locales/ja/translation.json $AM_DIR/XUI/locales/ja/
cp -r openam-ui-policy/src/main/resources/locales/ja/translation.json $AM_DIR/policyEditor/locales/ja/
cp -rf openam-server-only/src/main/webapp/config/auth/default_ja/* $AM_DIR/config/auth/default_ja/
find . -name '*.properties' -print | xargs cp -t $AM_DIR/WEB-INF/classes/
service tomcat6 restart
```

How to remove the files
------
1.    Execute the commands (if using Tomcat 6):
```bash
wget --no-check-certificate https://raw.githubusercontent.com/k-tamura/openam1200-japanese-properties/master/undeploy-jp-files.sh
chmod +x undeploy-jp-files.sh
./undeploy-jp-files.sh
service tomcat6 restart
```
Or

1.    Execute the commands (if using Tomcat 6):
```bash
export AM_DIR=/usr/share/tomcat6/webapps/openam
rm -fr $AM_DIR/XUI/locales/ja/
rm -fr $AM_DIR/policyEditor/locales/ja/
rm -f $AM_DIR/XUI/locales/ja/translation.json
rm -f $AM_DIR/policyEditor/locales/ja/translation.json
rm -f $AM_DIR/config/auth/default_ja/*_ja.properties
mv $AM_DIR/policyEditor/org/forgerock/openam/ui/policy/SiteConfigurationDelegate.js.bak $AM_DIR/policyEditor/org/forgerock/openam/ui/policy/SiteConfigurationDelegate.js
mv $AM_DIR/XUI/org/forgerock/openam/ui/common/delegates/SiteConfigurationDelegate.js.bak $AM_DIR/XUI/org/forgerock/openam/ui/common/delegates/SiteConfigurationDelegate.js
service tomcat6 restart
```
