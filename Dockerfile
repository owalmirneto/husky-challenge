FROM ruby:3.1.0-alpine

RUN apk add --update --virtual \
  runtime-deps \
  abuild \
  bash \
  build-base \
  binutils \
  cmake \
  file \
  gcc \
  git \
  libc-dev \
  libxslt-dev \
  libxml2-dev \
  linux-headers \
  make \
  musl-dev \
  nodejs \
  npm \
  postgresql-client \
  postgresql-dev \
  readline-dev \
  tzdata
RUN rm -rf /var/cache/apk/*

WORKDIR /app

COPY Gemfile Gemfile /app/
COPY Gemfile.lock Gemfile.lock /app/
COPY .ruby-version .ruby-version /app/

RUN npm install -g yarn && yarn install
RUN gem update --system && gem install bundler --no-document && bundle install
RUN bundle exec rails assets:precompile

COPY . .

