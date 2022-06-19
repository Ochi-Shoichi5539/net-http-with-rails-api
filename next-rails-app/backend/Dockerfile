FROM ruby:3.0.2

RUN wget --quiet -O - /tmp/pubkey.gpg https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo 'deb http://dl.yarnpkg.com/debian/ stable main' > /etc/apt/sources.list.d/yarn.list && \
    apt-get update -qq && apt-get install -y nodejs build-essential vim libpq-dev && \
    apt-get install -y yarn 

RUN mkdir /app

WORKDIR /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

RUN bundle install
