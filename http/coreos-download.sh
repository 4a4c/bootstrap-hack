# global vars
# dirname command is using script dir regardless of where it is executed from
BASE_DIR=$(dirname -- "$0")
COREOS_BASE="${BASE_DIR}/httpd/coreos"

# loop through builds file, for each line download
# tail -n +2 reads all lines starting on 2 (excluders headers)
tail -n +2 $BASE_DIR/coreos-builds.csv | while read line; do
  # set some vars
  CURRENT_LINE=$(echo $line)
  CHANNEL=$(echo $CURRENT_LINE | awk -F ',' '{print $1}')
  BUILD=$(echo $CURRENT_LINE | awk -F ',' '{print $2}')
  COREOS_SOURCE="https://${CHANNEL}.release.core-os.net/amd64-usr/${BUILD}"

  # echo messagge
  echo "synching ${CHANNEL} ${BUILD}"

  # ensure download dir exists
  mkdir -p $COREOS_BASE/$CHANNEL/$BUILD

  # check for files and download if they don't exist
  FILES="coreos_production_pxe.vmlinuz coreos_production_pxe_image.cpio.gz"
  for FILE in $FILES; do
    if [ ! -f $COREOS_BASE/$CHANNEL/$BUILD/$FILE ]; then
      curl -L $COREOS_SOURCE/$FILE -o $COREOS_BASE/$CHANNEL/$BUILD/$FILE
    fi
  done
done
