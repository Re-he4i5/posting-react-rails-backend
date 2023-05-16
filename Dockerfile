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
COPY Gemfile ${ROOT}
COPY Gemfile.lock ${ROOT}

RUN bundle install
COPY . ${ROOT}
#RUN rails db:create && rails db:migrate
#RUN rails db:seed



EXPOSE 3001
CMD ["rails", "server", "-b", "0.0.0.0"]
