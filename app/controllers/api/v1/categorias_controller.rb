module Api
	module V1
		class CategoriasController < ApplicationController

			respond_to :json

			def index
				respond_with Categoria.all
			end

			def show
				@noticias = Noticia.find_by_categoria( params[:categoria] )
				respond_with @noticias
			end
		end
	end
end