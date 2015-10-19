# openam1200-japanese-properties
OpenAM 12.0.0 Japanese properties

How to build
------
1.    Click the "Download ZIP" button and download openam1200-japanese-properties-master.zip.
2.    Run commands as follows:
```bash
unzip openam1200-japanese-properties-master.zip
rm openam1200-japanese-properties-master/README.md
svn co https://svn.forgerock.org/openam/tags/12.0.0/openam/
cp -pr openam1200-japanese-properties-master/* openam/
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
mkdir /var/lib/tomcat6/webapps/openam/XUI/locales/ja/
mkdir /var/lib/tomcat6/webapps/openam/policyEditor/locales/ja/
unzip openam1200-japanese-properties-master.zip
cd openam1200-japanese-properties-master
cp openam-ui-ria/src/main/resources/locales/ja/translation.json /var/lib/tomcat6/webapps/openam/XUI/locales/ja/translation.json
cp openam-ui-policy/src/main/resources/locales/ja/translation.json /var/lib/tomcat6/webapps/openam/policyEditor/locales/ja/translation.json
cp -rf openam-server-only/src/main/webapp/config/auth/default_ja/* /var/lib/tomcat6/webapps/openam/config/auth/default_ja/
find . -name '*.properties' -print | xargs cp -t /var/lib/tomcat6/webapps/openam/WEB-INF/classes/
service tomcat6 restart
```
