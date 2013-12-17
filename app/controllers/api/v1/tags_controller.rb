module Api
	module V1
		class TagsController < ApplicationController

			skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }

			before_action :get_tag, only: [:show, :edit, :update, :destroy]

			respond_to :json

			def index
				respond_with Tag.all
			end

			def show
				
			end

			def new
				
			end

			def create
				
			end

			def edit
				
			end

			def update
				
			end

			def destroy
				
			end

			private
				def tags_params
					params.require( :tag ).permit( :nombre )
				end

				def get_tag
					@tag = Tag.find( params[:id] )
				end
		end
	end
end