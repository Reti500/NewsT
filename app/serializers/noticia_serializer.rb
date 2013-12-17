class NoticiaSerializer < ActiveModel::Serializer
  attributes :titulo, :noticia, :user

  def user
  	if object.user
  		"#{object.user.username}"
  	else
  		"nil"
  	end
  end
end
