module Api
	module V1
		class NoticiasController < ApplicationController
			respond_to :json

			def index
				respond_with Noticia.all
			end

			private
				def noticia_params
					params.require( :noticia ).permit( :Titulo, :Noticia, :user_token )
				end
		end
	end
end