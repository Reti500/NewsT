class CreateNoticia < ActiveRecord::Migration
  def change
    create_table :noticia do |t|
      t.string :titulo
      t.text :noticia
      t.integer :user_id
      t.integer :categoria_id

      t.timestamps
    end
  end
end
