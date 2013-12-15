class CreateAsignarTags < ActiveRecord::Migration
  def change
    create_table :asignar_tags do |t|
      t.integer :noticia_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
