module Api
	module V1
		class NoticiasController < ApplicationController

			skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }

			before_action :get_noticia, only: [:show, :edit, :update, :destroy]

			respond_to :json

			def index
				if params[:dateAGo]
					respond_with Noticia.all.order( "updated_at < ?", 1.week.ago )
				else
					respond_with Noticia.all
				end
			end

			def show
				respond_with @noticia
			end

			def new
				
			end

			def create
				if @user = User.find( params[:user_id] )
					@noticia = Noticia.new( noticia_params )
					if @noticia.save
						respond_with @noticia
					else
						respond_with "Error"
					end
				end
			end

			def edit
				
			end

			def update
				@noticia.update( noticia_params )
				respond_with @noticia
			end

			def destroy
				
			end

			private
				def noticia_params
					params.require( :noticia ).permit( :titulo, :noticia, :user_id )
				end

				def get_noticia
					@noticia = Noticia.find( params[:id] )
				end
		end
	end
end