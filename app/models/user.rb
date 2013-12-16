class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :noticias

  belongs_to :role
end
