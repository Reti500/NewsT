class NoticiaSerializer < ActiveModel::Serializer
  attributes :id, :titulo, :noticia, :rating, :happy, :bad, :created_at

  def photo
  	if object.imagen.exists?
  		"object.imagen"
  	else
  		"nil"
  	end
  end
end
