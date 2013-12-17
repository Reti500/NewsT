module Api
	module V1
		class NoticiasController < ApplicationController

			skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }

			respond_to :json

			def index
				respond_with Noticia.all
			end

			def new
				
			end

			def create
				@noticia = Noticia.new( noticia_params )
				@noticia.save
				respond_with @noticia
			end

			private
				def noticia_params
					params.require( :noticia ).permit( :titulo, :noticia )
				end
		end
	end
end