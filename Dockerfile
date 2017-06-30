# Choose the official Ruby 2.1.2 image as our starting point
FROM ruby:2.4.1-alpine

RUN apk --update add --virtual build-dependencies \
                               build-base \
                               libxml2-dev \
                               libxslt-dev \
                               postgresql-dev \
                               postgresql \
                               postgresql-contrib \
                               nodejs \
                               tzdata \
                               python \
                               && rm -rf /var/cache/apk/*



ENV YARN_VERSION 0.20.0
ADD https://yarnpkg.com/downloads/$YARN_VERSION/yarn-v${YARN_VERSION}.tar.gz /opt/yarn.tar.gz
RUN yarnDirectory=/opt/yarn && \
    mkdir -p "$yarnDirectory" && \
    tar -xzf /opt/yarn.tar.gz -C "$yarnDirectory" && \
    ln -s "$yarnDirectory/dist/bin/yarn" /usr/local/bin/ && \
    rm /opt/yarn.tar.gz


RUN mkdir /usr/src/app
WORKDIR /usr/src/app

COPY . /usr/src/app

RUN gem update bundler
RUN bundle install --path vendor/bundle --without development test doc --deployment --jobs=4
RUN npm rebuild node-sass --force
#RUN ./bin/webpack --progress --color
RUN bundle exec rake assets:precompile RAILS_ENV=production
