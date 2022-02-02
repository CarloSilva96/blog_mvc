class CreateArtigos < ActiveRecord::Migration[6.1]
  def change
    create_table :artigos do |t|
      t.string :titulo
      t.text :conteudo

      t.timestamps
    end
  end
end
