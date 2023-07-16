# Imagem base do Ruby
FROM ruby:3.0.4

# Criando diretório de trabalho
WORKDIR /user/app

# Instalando dependências
RUN apt update && apt upgrade -y 
RUN gem install rails bundler

# Instalando o Node
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get install -y nodejs
RUN curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor | tee /usr/share/keyrings/yarnkey.gpg >/dev/null
RUN echo "deb [signed-by=/usr/share/keyrings/yarnkey.gpg] https://dl.yarnpkg.com/debian stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y yarn

# Instalando pacote PostgreSQL
RUN apt-get install -y libpq-dev

# Copiando as gemfiles
COPY Gemfile* /user/app/

# Copiando o projeto para o contêiner
COPY . .

# Instalando dependências
RUN bundle install

# Instalando NPM e Yarn
RUN npm install
RUN yarn

# Instalando o mailcatcher
RUN gem install mailcatcher --no-document

# Expondo a porta para uso
EXPOSE 3000
EXPOSE 1025
EXPOSE 1080

# Inicialização
CMD rails db:create db:migrate && rails server -b 0.0.0.0 -d && mailcatcher --ip=0.0.0.0 && bundle exec sidekiq

