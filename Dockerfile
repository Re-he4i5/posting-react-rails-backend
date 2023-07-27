# rubyの指定
FROM ruby:3.1.2

WORKDIR /usr/src

# railsのインストール
RUN gem install rails -v 6.1.4

# node jsのインストール
WORKDIR /usr/src
RUN curl -sL https://deb.nodesource.com/setup_16.x -o nodesource_setup.sh && bash nodesource_setup.sh && apt-get update && apt-get install nodejs

# yarnのインストール
RUN npm install -g yarn


WORKDIR /usr/src
COPY Gemfile /usr/src
COPY Gemfile.lock /usr/src

RUN bundle install
COPY . /usr/src
# RUN rails db:create && rails db:migrate
# RUN rails db:seed



EXPOSE 3001
CMD ["rails", "server", "-b", "0.0.0.0"]
