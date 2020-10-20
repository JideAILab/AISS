#! /bin/bash

USAGE="Usage: `basename $0` [-hv] [-o arg] args"

# At least one parameter (it may be a flag or an argument)
if [ $# -eq 0 ]; then
	echo $USAGE >&2
	exit 1
fi

# parse command line arguments
while getopts hvdr: OPT; do
    case "$OPT" in
	h)	echo $USAGE
		exit 0
		;;
    r)  docker rm $(docker stop $(docker ps -a -q --filter="name=aiss"))
        ;;
	v)	echo "`basename $0` version 0.1"
		exit 0
		;;
	d)	for ID in {0..10}
        do
            EXPOSE_PORT=$(($ID+8880))
            PROJECT_NAME="AISS${ID}"
            echo "ASCEND_CHIP_ID="${ID}" PORT="${EXPOSE_PORT} "docker-compose --project-name" ${PROJECT_NAME} "up -d" | bash -
        done
		;;
	\?)	# getopts issues an error message
		echo $USAGE >&2
		exit 1
		;;
    esac
done

shift `expr $OPTIND - 1`

# access additional parameters through $@ or $* as usual or using this loop:
for PARAM; do
    echo $PARAM
done

# EOF