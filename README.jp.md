# openam1200-japanese-properties
OpenAM 12.0.0 日本語化ファイル。以下のいずれかができます。
* 日本語に完全対応したOpenAM 12.0.0をビルドする
* デプロイ済みのOpenAM 12.0.0を完全な日本語対応にする

ビルド方法
------
※OpenAMのソースコードをチェックアウトするには、SVNクライアント 1.6.xが必要です。また、ビルドにはApache Maven 3.0.xが必要です。

以下コマンドを実行すると、OpenAM 12.0.0のソースコードをダウンロードし、それに日本語化ファイルをコピーしてMavenでビルドします: 
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
ビルドせずに既存のOpenAMにデプロイする場合は、以下の手順を実行します。

(1) OpenAMがデプロイされているWebアプリケーションコンテナを停止。  
(2) 以下のコマンドを実行:  
```bash
wget -N --no-check-certificate https://raw.githubusercontent.com/k-tamura/openam1200-japanese-properties/master/deploy-jp-files.sh
chmod +x deploy-jp-files.sh
./deploy-jp-files.sh
```
(3) Webアプリケーションコンテナを起動。  

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

ライセンス
------
ライセンに関してはOpenAMのwarファイルにあるlegal/CDDLv1.0.txtを参照して下さい。

The contents of this file are subject to the terms of the Common Development and Distribution License (the License). You may not use this file except in compliance with the License.

You can obtain a copy of the License at legal/CDDLv1.0.txt. See the License for the specific language governing permission and limitations under the License.

When distributing Covered Software, include this CDDL Header Notice in each file and include the License file at legal/CDDLv1.0.txt. If applicable, add the following below the CDDL Header, with the fields enclosed by brackets [] replaced by your own identifying information: "Portions copyright [year] [name of copyright owner]".

