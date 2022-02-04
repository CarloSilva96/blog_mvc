class Artigo < ApplicationRecord
  self.table_name = 'artigos'

  validates :titulo, presence: true, length: { minimum: 5 }
  validates :conteudo, presence: true, length: { minimum: 10}

  # setando tamanho da listagem nas paginas usando o kaminari
  paginates_per 2

  # ordenando retorno por ordem de criacao
  scope :desc_order, -> { order(created_at: :desc) }

  # retornando o 3 artigos mais recentes
  scope :get_artigos_recentes, ->(ids) { where("id NOT IN(#{ids})") }

end
