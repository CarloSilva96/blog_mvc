class ArtigosController < ApplicationController
  def index
    @artigos = Artigo.all
  end

  def show
    byebug
    @artigo = Artigo.find(params[:id])    
  end
end
