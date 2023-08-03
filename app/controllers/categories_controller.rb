class CategoriesController < ApplicationController
	def new 
		@category = Category.new
	end
	def create
		@category = Category.new(category_param)
		if @category.save
			flash[:notice] = "categories created successfully"
			redirect_to @category
		else
			render 'new'
		end
	end
	def show
		@category = Category.find(params[:id])
	end
	def index
	end


	private
	def category_param
		params.require(:category).permit(:name)
	end
end