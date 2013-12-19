module Api
	module V1
		class NoticiasController < ApplicationController

			skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }

			before_action :get_noticia, only: [:show, :edit, :update, :destroy]
			#before_action :get_user, only: [:create, :update]
			respond_to :json

			def index
				@limite = params[:limit].to_i or 10

				respond_with Noticia.all.order( "updated_at DESC" ).limit( @limite )
			end

			def show
				respond_with @noticia
			end

			def create
				@params = noticia_params

				if checkKeyApp( params[:key_app] )
					#@params[:user_id] = @user.id
					@params[:rating] = 0
					@params[:happy] = 0
					@params[:bad] = 0

					@noticia = Noticia.new( params[:noticia] )
					respond_with @noticia.save
				else
					respond_with :error => "Ninguna referencia"
				end
			end

			def update
				if @user and checkKeyApp( params[:key_app])
					respond_with @noticia.update( noticia_params )
				else
					respond_with :error => "Datos invalidos"
				end
			end

			def destroy
				
			end

			private
				def noticia_params
					params.require( :noticia ).permit( :titulo, :noticia, :imagen )
				end

				def get_noticia
					@noticia = Noticia.find( params[:id] )
				end

				def get_user
					@user = User.find_by( id: params[:id], key: params[:key_user] )
				end
		end
	end
end