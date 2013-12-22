module Api
	module V1
		class UsersController < ApplicationController

			skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }
			respond_to :json

			before_action :get_user, only: [:show, :update]

			def show
				if @user and checkKeyApp( params[:key_app] )
					respond_with @user
				else
					respond_with :errors => "Nada por hacer"
				end
			end

			def create
				if checkKeyApp( params[:key_app] )

					@params = user_params

					@params[:role_id] = Role.find_by( nombre: "user" ).id
					@params[:key] = SecureRandom.hex

					@user = User.new( @params )

					if @user.save
						respond_with @user
					else
						respond_to do |format|
							format.json { render :json => @user.errros }
						end
					end

				else
					respond_with :errors => "Algo salio mal"
				end
			end

			def update
				if @user and checkKeyApp( params[:key_app] )
					respond_with @user.update( user_params )
				else
					respond_with :errors => "Algo salio mal"
				end
			end

			private
				def user_params
					params.require( :user ).permit( :username, :email, :password, :password_confirmation )
				end

				def get_user
					@user = User.find_by( id: params[:id], key: params[:key_user] )
				end
		end
	end
end