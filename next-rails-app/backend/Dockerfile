FROM ruby:3.0.2-alpine3.14

ENV ROOT="/app/"
ENV TZ=Asia/Tokyo

WORKDIR ${ROOT}

RUN apk add --update --no-cache \
        bash \
        less \
        g++ \
        gcompat \
        git \
        libc-dev \
        libxml2-dev \
        linux-headers \
        make \
        nodejs \
        postgresql \
        postgresql-dev \
        tzdata \
        yarn && \
    apk add --virtual build-packs --no-cache \
        build-base \
        curl

COPY Gemfile* ${ROOT}

RUN bundle install -j4
RUN apk del build-packs

COPY . ${ROOT}

# Add a script to be executed every time the container starts.
RUN set -e \
    rm -f /app/tmp/pids/server.pid 
