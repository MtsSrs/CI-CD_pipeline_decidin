#!/bin/sh


until rails db:create; do
  echo "Aguardando o banco de dados..."
  sleep 2
done

rails db:migrate

bundle exec rails server -b 0.0.0.0
