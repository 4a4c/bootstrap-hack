# tail -n +2 reads all lines starting on 2 (excluders headers)
# dirname command is using script dir regardless of where it is executed from

# loop through builds file, for each line download
tail -n +2 $(dirname -- "$0")/coreos-builds.csv | while read line
  do 
    # set some vars
    CURRENT_LINE=$(echo $line)
    CHANNEL=$(echo $CURRENT_LINE | awk -F ',' '{print $1}')
    BUILD=$(echo $CURRENT_LINE | awk -F ',' '{print $2}')
    
    # test messagge
    echo "channel is ${CHANNEL} build is ${BUILD}"
    
    # ensure download dir exists
    mkdir -p $(dirname -- "$0")/httpd/coreos/$CHANNEL

    # check for files and download if they don't exist
    
  done
