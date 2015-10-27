# openam1200-japanese-properties
OpenAM 12.0.0 日本語化ファイル

ビルド方法
------
OpenAMのソースコードを匿名でチェックアウトするには、SVNクライアント 1.6.xが必要です。また、ビルドにはApache Maven 3.0.xが必要です。

(1) "Download ZIP"ボタンをクリックし、openam1200-japanese-properties-master.zipをダウンロード。  
(2) 以下のコマンドを実行:  
```bash
unzip openam1200-japanese-properties-master.zip
rm openam1200-japanese-properties-master/README.*
rm openam1200-japanese-properties-master/*.sh
svn co https://svn.forgerock.org/openam/tags/12.0.0/openam/
cp -r openam1200-japanese-properties-master/* openam/
rm -fr openam1200-japanese-properties-master
cd openam
export MAVEN_OPTS="-Xmx1024m -XX:MaxPermSize=512m"
mvn -DskipTests=true clean install
```

ビルドせずにデプロイする方法
------
ビルドせずに既存のOpenAMにデプロイする場合は、以下の手順を実行する。

(1) OpenAMがデプロイされているWebアプリケーションコンテナを停止。  
(2) 以下のコマンドを実行:  
```bash
wget -N --no-check-certificate https://raw.githubusercontent.com/k-tamura/openam1200-japanese-properties/master/deploy-jp-files.sh
chmod +x deploy-jp-files.sh
./deploy-jp-files.sh
```
(3) Webアプリケーションコンテナを起動。  

または

(1) "Download ZIP"ボタンをクリックし、openam1200-japanese-properties-master.zipをダウンロード。  
(2) OpenAMがデプロイされているWebアプリケーションコンテナを停止。  
(3) 以下のコマンドを実行:  
```bash
export AM_DIR=/usr/share/tomcat6/webapps/openam
mkdir -p $AM_DIR/XUI/locales/ja/
mkdir -p $AM_DIR/policyEditor/locales/ja/
unzip openam1200-japanese-properties-master.zip
cp -pr $AM_DIR/config/auth/default_ja $AM_DIR/config/auth/default_ja_bak
mv -f $AM_DIR/policyEditor/org/forgerock/openam/ui/policy/SiteConfigurationDelegate.js $AM_DIR/policyEditor/org/forgerock/openam/ui/policy/SiteConfigurationDelegate.js.bak
mv -f $AM_DIR/XUI/org/forgerock/openam/ui/common/delegates/SiteConfigurationDelegate.js $AM_DIR/XUI/org/forgerock/openam/ui/common/delegates/SiteConfigurationDelegate.js.bak
cp openam1200-japanese-properties-master/openam-ui-policy/src/main/js/org/forgerock/openam/ui/policy/delegates/SiteConfigurationDelegate.js $AM_DIR/policyEditor/org/forgerock/openam/ui/policy/SiteConfigurationDelegate.js
cp openam1200-japanese-properties-master/openam-ui-ria/src/main/js/org/forgerock/openam/ui/common/delegates/SiteConfigurationDelegate.js $AM_DIR/XUI/org/forgerock/openam/ui/common/delegates/SiteConfigurationDelegate.js
cp -r openam1200-japanese-properties-master/openam-ui-ria/src/main/resources/locales/ja/translation.json $AM_DIR/XUI/locales/ja/
cp -r openam1200-japanese-properties-master/openam-ui-policy/src/main/resources/locales/ja/translation.json $AM_DIR/policyEditor/locales/ja/
cp -rf openam1200-japanese-properties-master/openam-server-only/src/main/webapp/config/auth/default_ja/* $AM_DIR/config/auth/default_ja/
find openam1200-japanese-properties-master -name '*.properties' -print | xargs cp -t $AM_DIR/WEB-INF/classes/
rm -fr openam1200-japanese-properties-master
rm openam1200-japanese-properties-master.zip
```
(4) Webアプリケーションコンテナを起動。  

デプロイしたファイルを削除する方法
------
(1) OpenAMがデプロイされているWebアプリケーションコンテナを停止。  
(2) 以下のコマンドを実行:  
```bash
wget -N --no-check-certificate https://raw.githubusercontent.com/k-tamura/openam1200-japanese-properties/master/undeploy-jp-files.sh
chmod +x undeploy-jp-files.sh
./undeploy-jp-files.sh
```
(3) Webアプリケーションコンテナを起動。  

または

(1) OpenAMがデプロイされているWebアプリケーションコンテナを停止。  
(2) 以下のコマンドを実行:  
```bash
export AM_DIR=/usr/share/tomcat6/webapps/openam
rm -fr $AM_DIR/XUI/locales/ja
rm -fr $AM_DIR/policyEditor/locales/ja
rm -f $AM_DIR/WEB-INF/classes/*_ja.properties
\cp -fr $AM_DIR/config/auth/default_ja_bak/* $AM_DIR/config/auth/default_ja/
rm -f $AM_DIR/config/auth/default_ja/DeviceIdMatch.xml $AM_DIR/config/auth/default_ja/DeviceIdSave.xml
rm -fr $AM_DIR/config/auth/default_ja_bak
mv -f $AM_DIR/policyEditor/org/forgerock/openam/ui/policy/SiteConfigurationDelegate.js.bak $AM_DIR/policyEditor/org/forgerock/openam/ui/policy/SiteConfigurationDelegate.js
mv -f $AM_DIR/XUI/org/forgerock/openam/ui/common/delegates/SiteConfigurationDelegate.js.bak $AM_DIR/XUI/org/forgerock/openam/ui/common/delegates/SiteConfigurationDelegate.js
```
(3) Webアプリケーションコンテナを起動。  

ライセンス
------
The contents of this file are subject to the terms of the Common Development and Distribution License (the License). You may not use this file except in compliance with the License.

You can obtain a copy of the License at legal/CDDLv1.0.txt. See the License for the specific language governing permission and limitations under the License.

When distributing Covered Software, include this CDDL Header Notice in each file and include the License file at legal/CDDLv1.0.txt. If applicable, add the following below the CDDL Header, with the fields enclosed by brackets [] replaced by your own identifying information: "Portions copyright [year] [name of copyright owner]".

