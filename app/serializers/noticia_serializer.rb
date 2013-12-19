class NoticiaSerializer < ActiveModel::Serializer
  attributes :id, :titulo, :noticia, :rating, :happy, :bad, :imagen, :created_at

  def imagen
  	if object.imagen.exists?
  		imagen
  	else
  		"nil"
  	end
  end
end
