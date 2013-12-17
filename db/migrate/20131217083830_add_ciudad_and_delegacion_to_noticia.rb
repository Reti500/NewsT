class AddCiudadAndDelegacionToNoticia < ActiveRecord::Migration
  def change
    add_column :noticia, :ciudad, :string
    add_column :noticia, :delegacion, :string
  end
end
