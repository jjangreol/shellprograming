#1/bin/bash
echo -n "filename ?? : "
read FILENAME

# echo $FILENAME
if [ -x "$FILENAME" ]; then
    $FILENAME
else
    echo "[FAIL] $FILENAME: file no "
    exit 1
fi
