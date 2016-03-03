FROM ruby:2.2

RUN gem install term-ansicolor

RUN mkdir /app
WORKDIR /app
ADD . /app

CMD ruby /app/statsd.rb
