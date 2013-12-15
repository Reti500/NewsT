class Tag < ActiveRecord::Base
	has_many :asignarTags
	has_many :noticias, through: :asignarTags
end
