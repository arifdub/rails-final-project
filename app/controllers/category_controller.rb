class CategoryController < ApplicationController
	def category
		@Menus = Menu.where(category: params[:id])
		@category = params[:id]
	end
		
end
