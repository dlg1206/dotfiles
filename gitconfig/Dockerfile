# Create git command testing env
FROM alpine:latest
RUN apk add git
RUN adduser -D git
# setup testing repo
USER git
WORKDIR /home/git
# copy local config to test
RUN git init test-repo
WORKDIR /home/git/test-repo

# To build: docker build -t git .
# To run: docker run --rm -it -v "${PWD}/.gitconfig:/home/git/.gitconfig" git
ENTRYPOINT ["ash"]