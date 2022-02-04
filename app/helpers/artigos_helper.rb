# metodos criados para serem utilizados na view
module ArtigosHelper
  def dia_me_ano(data_criacao)
    data_criacao.strftime('%e %B, %Y')
  end

  # helper para tratar erro quando não existe artigos criados
  def render_se(condicao, template, registro)
    render template, registro if condicao
  end
end
