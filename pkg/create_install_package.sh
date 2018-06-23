
#!/bin/sh
echo create install package for $1

INSTALL_DIR=$1
cd  ../orac/modules/
cp ../../pkg/deploy.sh ./$INSTALL_DIR/

if [ -f "$INSTALL_DIR/deploy.sh" ]
then
    chmod +x "$INSTALL_DIR/deploy.sh"
fi

if [ -f "$INSTALL_DIR/manifest.txt" ]
then
    echo move existing manifest away
    cp "$INSTALL_DIR/manifest.txt" /tmp
    rm "$INSTALL_DIR/manifest.txt"
fi
rm -rf __MACOSX

find "$INSTALL_DIR" -type f ! -name "._*" -print0  | xargs -0 sha1sum > /tmp/manifest.new
cp /tmp/manifest.new "$INSTALL_DIR/manifest.txt"
rm /tmp/manifest.new
pwd

zip -r "$1.zop" "$INSTALL_DIR"/*

mv "$1.zop" ../../pkg
