class AsignarTag < ActiveRecord::Base
	belongs_to :tag
	belongs_to :noticia
end
