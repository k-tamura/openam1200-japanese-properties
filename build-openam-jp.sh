#!/bin/sh
# Get OpenAM 12.0.0 source code from GitHub if it does not exist on local.
if [ ! -e 12.0.0.zip ]; then
    wget -N --no-check-certificate https://github.com/ForgeRock/openam/archive/12.0.0.zip
fi

# Get Japanese properties from GitHub.
wget --no-check-certificate https://codeload.github.com/k-tamura/openam1200-japanese-properties/zip/master -O openam1200-japanese-properties-master.zip

# Copy the Japanese properties to OpenAM 12 source code.
rm -fr openam-12.0.0
unzip 12.0.0.zip
unzip openam1200-japanese-properties-master.zip
rm openam1200-japanese-properties-master/README.*
rm openam1200-japanese-properties-master/*.sh
\cp -r openam1200-japanese-properties-master/* openam-12.0.0/
rm -fr openam1200-japanese-properties-master
cd openam-12.0.0

# Read a user input (path to mvn command).
echo "Please input path to the mvn command if needed. For example, /usr/local/apache-maven-3.0.4/bin/mvn"
read MVN_CMD
if [ "$MVN_CMD" = "" ]; then
    MVN_CMD=mvn
fi
# Build OpenAM
export MAVEN_OPTS="-Xmx1024m -XX:MaxPermSize=512m"
$MVN_CMD -DskipTests=true clean install
