module Api
	module V1
		class UsersController < ApplicationController

			skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }
			respond_to :json

			before_action :get_user, only: [:show, :update]

			# def index
			# 	respond_with User.all
			# end

			def show
				if @user and checkKeyApp
					respond_with @user
				else
					respond_with :errors => "Nada por hacer"
				end
			end

			def create
				
				if checkKeyApp

					@params = user_params

					@params[:role_id] = Role.find_by( nombre: "user" ).id
					@params[:key] = SecureRandom.hex
					@user = User.new( @params )

					@user.save

					respond_with @user
				else
					respond_with :errors => "Algo salio mal"
				end
			end

			def update
				if @user and checkKeyApp
					#@user = User.update( user_params )
					@user.update( user_params )
					respond_with @user
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

				def checkKeyApp
					return true if params[:key_app] == getKeyApp else false
				end
		end
	end
end