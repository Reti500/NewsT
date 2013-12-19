class AddRatingHappyAndBadToNoticia < ActiveRecord::Migration
  def change
    add_column :noticia, :rating, :integer
    add_column :noticia, :happy, :integer
    add_column :noticia, :bad, :integer
  end
end
