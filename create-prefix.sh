#!/bin/sh

echo "Copying qt prefix from docker container"
docker run --rm -it -v $(pwd):/src madmanfred/obs-environment:static-reloc sh -c "cp -r /qtbase /src/qt-prefix && chown -R $(id -u):$(id -g) /src/qt-prefix"

echo "Preparing qt prefix"
mv qt-prefix/bin/qmake qt-prefix/bin/qmake.old
cp docker-proxies/qmake qt-prefix/bin/qmake
chmod a+x qt-prefix/bin/qmake

echo "Created qt prefix at $(pwd)/qt-prefix"
echo "You have to add it in qtcreator as a version"
echo "Then you can create a new kit with the version"
echo "You have to add PATH=$(pwd)/docker-proxies:\$PATH to the environment variables of the new kit"
echo ""
echo "The new kit will only work, if you disable shadow build for your project"
