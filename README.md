# openam1200-japanese-properties
OpenAM 12.0.0 Japanese properties.

How to build
------
You need SVN client version 1.6.x to checkout code anonymously and Maven 3.0.x for building.

Execute the commands to copy Japanese properties to the OpenAM 12.0.0 source code and build it by Maven:   
```bash
wget -N --no-check-certificate https://raw.githubusercontent.com/k-tamura/openam1300-japanese-properties/master/build-openam-jp.sh
chmod +x build-openam-jp.sh
./build-openam-jp.sh
```

How to deploy without build
------
If you do not want to build, you can deploy all files.

(1) Shut down the web application container in which you deployed OpenAM.  
(2) Execute the commands:  
```bash
wget -N --no-check-certificate https://raw.githubusercontent.com/k-tamura/openam1200-japanese-properties/master/deploy-jp-files.sh
chmod +x deploy-jp-files.sh
./deploy-jp-files.sh
```
(3) Start up the web application container.  

How to remove the files
------
(1) Shut down the web application container in which you deployed OpenAM.  
(2) Execute the commands:  
```bash
wget -N --no-check-certificate https://raw.githubusercontent.com/k-tamura/openam1200-japanese-properties/master/undeploy-jp-files.sh
chmod +x undeploy-jp-files.sh
./undeploy-jp-files.sh
```
(3) Start up the web application container.  

License
------
Please refer to the legal/CDDLv1.0.txt in OpenAM war file.

The contents of this file are subject to the terms of the Common Development and Distribution License (the License). You may not use this file except in compliance with the License.

You can obtain a copy of the License at legal/CDDLv1.0.txt. See the License for the specific language governing permission and limitations under the License.

When distributing Covered Software, include this CDDL Header Notice in each file and include the License file at legal/CDDLv1.0.txt. If applicable, add the following below the CDDL Header, with the fields enclosed by brackets [] replaced by your own identifying information: "Portions copyright [year] [name of copyright owner]".
