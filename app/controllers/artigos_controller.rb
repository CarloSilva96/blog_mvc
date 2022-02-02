class ArtigosController < ApplicationController
  def index
    @artigos = Artigo.all
  end
end
