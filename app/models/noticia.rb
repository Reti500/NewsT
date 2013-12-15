class Noticia < ActiveRecord::Base
	belongs_to :user
	belongs_to :categoria

	has_many :asignarTags
	has_many :tags, through: :asignarTags
end
