set -eu
FILENAME=$(basename $0)
FILENAME_WITHOUT_EXT=${FILENAME%.*}
CONTAINER_TAG='hokupod/ruby-3_0_1'

if test $# -ne 1 -a $# -ne 2; then
    echo argument error: $*
    exit 1
fi

cd $(dirname $0) || exit 1

if [[ $1 =~ ^build ]]; then
    echo 'step0: docker build'
    docker build -t  $CONTAINER_TAG .
fi

if [[ $1 =~ run|test$ ]]; then
    if [[ $1 =~ run$ ]]; then
        echo 'step1: copy to docker container'
        cp $2 target/

        echo 'step2: start script'
        docker run -it --rm --mount type=bind,src=$(pwd),dst=/home $CONTAINER_TAG bundle exec ruby src/$FILENAME_WITHOUT_EXT.rb target/$(basename $2)
    elif [[ $1 =~ test$ ]]; then
        echo 'step1: start test'
        docker run -it --rm --mount type=bind,src=$(pwd),dst=/home $CONTAINER_TAG bundle exec ruby $2
    fi

    cd - || exit 1
fi

exit 0
