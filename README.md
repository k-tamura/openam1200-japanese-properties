# openam1200-japanese-properties
OpenAM 12.0.0 Japanese properties

How to build
------
1.    Click the "Download ZIP" button and download openam1200-japanese-properties-master.zip.
2.    Run commands as follows:
```bash
unzip openam1200-japanese-properties-master.zip
rm openam1200-japanese-properties-master/README.*
svn co https://svn.forgerock.org/openam/tags/12.0.0/openam/
cp -r openam1200-japanese-properties-master/* openam/
cd openam
export MAVEN_OPTS="-Xmx1024m -XX:MaxPermSize=512m"
mvn -DskipTests=true clean install
```

How to deploy without build
------
If you do not want to build, you can deploy all files.

1.    Click the "Download ZIP" button and download openam1200-japanese-properties-master.zip.
2.    Run commands as follows:
```bash
export AM_DIR=/usr/share/tomcat6/webapps/openam
mkdir $AM_DIR/XUI/locales/ja/
mkdir $AM_DIR/policyEditor/locales/ja/
unzip openam1200-japanese-properties-master.zip
cd openam1200-japanese-properties-master
cp openam-ui-ria/src/main/resources/locales/ja/translation.json $AM_DIR/XUI/locales/ja/translation.json
cp openam-ui-policy/src/main/resources/locales/ja/translation.json $AM_DIR/policyEditor/locales/ja/translation.json
cp -rf openam-server-only/src/main/webapp/config/auth/default_ja/* $AM_DIR/config/auth/default_ja/
find . -name '*.properties' -print | xargs cp -t $AM_DIR/WEB-INF/classes/
service tomcat6 restart
```

How to remove the files
------
1.    Run commands as follows:
```bash
export AM_DIR=/usr/share/tomcat6/webapps/openam
rm -fr $AM_DIR/XUI/locales/ja/
rm -fr $AM_DIR/policyEditor/locales/ja/
rm -f $AM_DIR/XUI/locales/ja/translation.json
rm -f $AM_DIR/policyEditor/locales/ja/translation.json
rm -f $AM_DIR/config/auth/default_ja/*_ja.properties
service tomcat6 restart
```
