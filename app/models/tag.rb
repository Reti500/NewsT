class Tag < ActiveRecord::Base
	# /#(\S+)/

	has_many :asignarTags
	has_many :noticias, through: :asignarTags


end
