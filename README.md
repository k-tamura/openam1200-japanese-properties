# openam1200-japanese-properties
OpenAM 12.0.0 Japanese properties

* Under construction.

How to build
------
1.    Click the "Download ZIP" button and download openam1200-japanese-properties-master.zip.
2.    Run commands as follows:
```bash
svn co https://svn.forgerock.org/openam/tags/12.0.0/openam/
unzip openam1200-japanese-properties-master.zip
rm openam1200-japanese-properties-master/README.md
cp -pr openam1200-japanese-properties-master/* openam/
cd openam
mvn -DskipTests=true clean install
```
