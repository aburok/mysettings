if [ ! -f ./dockertag ]; then
    echo "./dockertag file does not exist"
    exit 1
fi

export DOCKER_HUB_NAME=gringokromka

docker build . -t $(cat ./dockertag)
docker image tag $(cat dockertag) $DOCKER_HUB_NAME/$(cat dockertag)
docker image push $DOCKER_HUB_NAME/$(cat dockertag) 