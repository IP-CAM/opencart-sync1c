#!/bin/bash

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do
    DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
    SOURCE="$(readlink "$SOURCE")"
    [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

INSTALL_DIR="$DIR/../www/opencart-2"
UPLOAD_DIR="$DIR/upload"

FILES=(
    "admin/language/english/module/sync_1c.php"
    "admin/view/template/module/sync_1c.tpl"
    "admin/controller/module/sync_1c.php"
)

for FILE in "${FILES[@]}"; do
    DIR="$( dirname "$FILE" )"

    if [ ! -d "$UPLOAD_DIR/$DIR" ]; then
      mkdir -p "$UPLOAD_DIR/$DIR"
    fi

    echo "> $FILE"
    cp -ar "$INSTALL_DIR/$FILE" "$UPLOAD_DIR/$FILE"
done

echo "All ready, Sir!"
