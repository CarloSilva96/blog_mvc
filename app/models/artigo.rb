class Artigo < ApplicationRecord
    validates :titulo, presence: true, length: { minimum: 5 }
    validates :conteudo, presence: true, length: { minimum: 10}

    self.table_name = 'artigos'
end
