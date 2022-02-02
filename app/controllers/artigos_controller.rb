class ArtigosController < ApplicationController
  def index
    @artigos = Artigo.all
  end

  def show
    @artigo = Artigo.find(params[:id])    
  end

  def create
    @artigo = Artigo.new(artigos_params)

    if @artigo.save
      # direciona para o show do artigo, o rails entende isso
      redirect_to @artigo
    else
      render :new
    end
  end

  def new
    @artigo = Artigo.new
  end

  private

  def artigos_params
    params.require(:artigo).permit(:titulo, :conteudo)
  end

end
