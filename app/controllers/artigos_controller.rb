class ArtigosController < ApplicationController
  before_action :set_artigo, only: %i[show edit update destroy]

  def index
    # pegando página atual do params
    pagina_atual = (params[:page] || 1).to_i

    # fazendo paginacao e ordenando por ordem de criacao(do mais novo para mais antigo)
    @artigos = Artigo.order(created_at: :desc).page(pagina_atual).per(2)
  end

  def show; end

  def create
    @artigo = Artigo.new(artigos_params)

    if @artigo.save
      # direciona para o show do artigo, o rails entende isso
      redirect_to @artigo
    else
      render :new
    end
  end

  def update 
    # atualizando e passando parametros que vem do formulario 
    if @artigo.update(artigos_params)
      redirect_to @artigo
    else
      render :edit
    end
  end

  def destroy
    @artigo.destroy
    redirect_to root_path
  end

  def new
    @artigo = Artigo.new
  end

  def edit; end

  private

  def artigos_params
    params.require(:artigo).permit(:titulo, :conteudo)
  end

  def set_artigo
    @artigo = Artigo.find(params[:id])
  end

end