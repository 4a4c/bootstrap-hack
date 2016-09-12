# global vars
# dirname command is using script dir regardless of where it is executed from
BASE_DIR=$(dirname -- "$0")

# tail -n +2 reads all lines starting on 2 (excluders headers)

# loop through builds file, for each line download
tail -n +2 $BASE_DIR/coreos-builds.csv | while read line
  do 
    # set some vars
    CURRENT_LINE=$(echo $line)
    CHANNEL=$(echo $CURRENT_LINE | awk -F ',' '{print $1}')
    BUILD=$(echo $CURRENT_LINE | awk -F ',' '{print $2}')
    
    # test messagge
    echo "channel is ${CHANNEL} build is ${BUILD}"
    
    # ensure download dir exists
    mkdir -p $BASE_DIR/httpd/coreos/$CHANNEL

    # check for files and download if they don't exist
    #if [ !f ]
  done
