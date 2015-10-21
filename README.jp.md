# openam1200-japanese-properties
OpenAM 12.0.0 日本語化ファイル

ビルド方法
------
1.    "Download ZIP"ボタンをクリックし、openam1200-japanese-properties-master.zipをダウンロード。
2.    以下のコマンドを実行:
```bash
unzip openam1200-japanese-properties-master.zip
rm openam1200-japanese-properties-master/README.*
svn co https://svn.forgerock.org/openam/tags/12.0.0/openam/
cp -r openam1200-japanese-properties-master/* openam/
cd openam
export MAVEN_OPTS="-Xmx1024m -XX:MaxPermSize=512m"
mvn -DskipTests=true clean install
```

ビルドせずにデプロイする方法
------
ビルドせずに既存のOpenAMにデプロイする場合は、以下の手順を実行する。

1.    "Download ZIP"ボタンをクリックし、openam1200-japanese-properties-master.zipをダウンロード。
2.    以下のコマンドを実行:
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
