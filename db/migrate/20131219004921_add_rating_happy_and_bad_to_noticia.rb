class AddRatingHappyAndBadToNoticia < ActiveRecord::Migration
  def change
    add_column :noticia, :rating, :integer
  end
end
