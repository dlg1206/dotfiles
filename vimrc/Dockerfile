# Create vim command testing env
FROM alpine:latest
RUN apk add --no-cache vim
RUN adduser -D vim
# setup testing repo
USER vim
WORKDIR /home/vim

# To build: docker build -t vim .
# To run: docker run --rm -it -v "${PWD}/.vimrc:/home/vim/.vimrc" vim
ENTRYPOINT ["ash"]