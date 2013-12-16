module Api
	module V1
		class NoticiasController < ApplicationController
			respond_to :json

			def index
				respond_with Noticia.all
			end
		end
	end
end