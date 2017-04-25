FROM alpine:latest

RUN echo http://dl-2.alpinelinux.org/alpine/edge/community/ >> /etc/apk/repositories

RUN set -ex \
    && apk add --update --no-cache ruby \
    && apk add --update --no-cache --virtual build-dependencies \
        build-base \
        ruby-dev \
        libffi-dev \
        nodejs \
        shadow \
        bash \
    && gem install --no-document \
        json \
        compass \
        sass \
    && npm install -g \
    	bower \
    	bundler \
    	grunt-cli \
    	gulp-cli \
    && apk del build-dependencies

# Add user 1000
RUN adduser -D -u 1000 user-ext

CMD ["node"]
