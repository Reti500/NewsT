module Api
	module V1
		class UsersController < ApplicationController

			skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }
			respond_to :json

			def index
				respond_with User.all
			end

			def show
				
			end

			def create
				
				if params[:key_app] == getKeyApp

					@params = user_params

					@params[:role_id] = Role.find_by( nombre: "user" ).id
					@user = User.new( @params )

					@user.save

					respond_with @user
				else
					respond_with user_params
				end
			end

			def update
				
			end

			private
				def user_params
					params.require( :user ).permit( :username, :email, :password, :password_confirmation )
				end
		end
	end
end