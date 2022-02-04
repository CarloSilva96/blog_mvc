class ArtigosController < ApplicationController
  before_action :set_artigo, only: %i[show edit update destroy]

  def index
    # pegando os 3 artigos recentes
    @artigos_recentes = Artigo.desc_order.first(3)

    # pegando página atual do params
    pagina_atual = (params[:page] || 1).to_i

    # retornando os IDS do artigos recentes com formato de string separado por virgula
    artigos_recentes_ids = @artigos_recentes.pluck(:id).join(',')
    
    if artigos_recentes_ids.present?
      # fazendo paginacao e ordenando por ordem de criacao(do mais novo para mais antigo) sem os 3 artigos mais recentes
      @artigos = Artigo.get_artigos_recentes(artigos_recentes_ids) 
                       .desc_order.page(pagina_atual)
    else
      # fazendo paginacao e ordenando por ordem de criacao(do mais novo para mais antigo) 
      @artigos = Artigo.desc_order.page(pagina_atual)
    end
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