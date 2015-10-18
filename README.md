# openam1200-japanese-properties
OpenAM 12.0.0 Japanese properties

* Under construction.

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
