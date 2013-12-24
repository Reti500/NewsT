module Api
	module V1
		class NoticiasController < ApplicationController

			skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }

			before_action :get_noticia, only: [:show, :edit, :update, :destroy]
			before_action :get_user, only: [:create, :update]
			respond_to :json

			def index
				@limite = params[:limit].to_i or 10

				respond_with Noticia.all.order( "updated_at DESC" ).limit( 10 )
			end

			def show
				respond_with @noticia
			end

			def create
				@params = noticia_params
				@tags = []

				if checkKeyApp( params[:key_app] ) and @user
					cat = params[:categoria] or "Normal"
					@params[:categoria_id] = Categoria.find_by( nombre: cat ).id or nil
					@params[:user_id] = @user.id
					@params[:rating] = 0

					@noticia = Noticia.new( @params )
					if @noticia.save
						getTags( @params[:noticia].split( ' ' ), @tags )
						if @tags
							@tags.each do |t|
								newTag = Tag.find_or_create_by( nombre: t )
								@noticia.tags << newTag
							end
						end

						respond_to do |format| 
							format.json { render :json => @noticia }
						end
					else
						respond_to do |format|
							format.json { render :json => @noticia.errors }
						end
					end
				else
					respond_to do |format| 
						format.json { render :json => "Error fatal" }
					end
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