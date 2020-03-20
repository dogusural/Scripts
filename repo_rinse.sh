#!/bin/bash



function usage {
    echo "  Usage:           bash $0 [-ci]"
    echo "  -c, --clean      Clean the project and the submodules. Hard reset to latest revision."
    echo "  -i, --init       Sync and pull the project and the submodules."
    exit 1
}
function clean {
    git clean -xfd
    git submodule foreach --recursive git clean -xfd
    git reset --hard
    git submodule foreach --recursive git reset --hard
    git submodule update --init --recursive
    exit 1
}
function init {
    git submodule sync
    git submodule update --init --recursive
    exit 1
}


if [ $# -ne "1" ]; then
    usage
fi

key="$1"

case $key in
    -i|--init)
    init
    ;;
    -c|--clean)
    clean
    ;;
    --default)
    usage
    ;;
esac





