Rails.application.routes.draw do
  # rota raiz / inicial ao acessar localhost
  root 'artigos#index'

  # rota de artigos
  get '/artigos', to: 'artigos#index'
end
