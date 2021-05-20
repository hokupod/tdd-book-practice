FROM ruby:3.0.1-alpine

ADD . /home
WORKDIR /home
RUN apk add --update \
  build-base \
  less \
  && rm -rf /var/cache/apk/*

RUN bundle install
