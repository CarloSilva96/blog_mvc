# metodos criados para serem utilizados na view
module ArtigosHelper
  def dia_me_ano(data_criacao)
    data_criacao.strftime('%e %B, %Y')
  end
end
