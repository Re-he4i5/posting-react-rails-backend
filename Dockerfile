# rubyの指定
FROM ruby:3.1.2

ENV ROOT="/posting-react-rails-backend"

# railsのインストール
RUN gem install rails -v 6.1.4

# node jsのインストール
WORKDIR /usr/src
RUN curl -sL https://deb.nodesource.com/setup_16.x -o nodesource_setup.sh && bash nodesource_setup.sh && apt-get update && apt-get install nodejs

# yarnのインストール
RUN npm install -g yarn


WORKDIR ${ROOT}
COPY . ${ROOT}

RUN bundle install