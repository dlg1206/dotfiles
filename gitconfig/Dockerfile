# Create git comman testing env
FROM alpine:latest
RUN apk add git
RUN adduser -D git
# setup testing repo
USER git
WORKDIR /home/git
# copy local config to test
COPY .gitconfig .gitconfig
RUN git init test-repo
WORKDIR /home/git/test-repo

ENTRYPOINT ["ash"]