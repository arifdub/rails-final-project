class CartController < ApplicationController
  	before_filter :authenticate_user!, only:[:createOrder, :ordershow] #user must be login to checkout option
	def add
		id= params[:id]
		if session[:cart] then
			cart = session[:cart]
		else
			session[:cart] = {}
			cart = session[:cart]
		end
		if cart[id] then
			cart[id] = cart[id] + 1
		else
			cart[id] = 1
		end
		redirect_to :action => :index
		
	end
	def clearCart
		session[:cart] = nil
		redirect_to :action => :index
	end
  
	def index
		if session[:cart] then
			@cart = session[:cart]
		else
			@cart = {}
		end
	end
	def remove
		id = params[:id]
		cart = session[:cart]
		cart.delete id
		redirect_to :action => :index
	end
	def createOrder
		 # Step 1: Get the current user
		 @user = User.find(current_user.id)
		
		 # Step 2: Create a new order and associate it with the current user
		 @order = @user.orders.build(:order_date => DateTime.now)
		 @order.save
		
		 # Step 3: For each item in the cart, create a new item on the order!!
		 @cart = session[:cart] || {} # Get the content of the Cart
		 @cart.each do | id, quantity |
		 menu = Menu.find_by_id(id)
		 @orderitem = @order.orderitems.build(:item_id => menu.id, :title => menu.title, :description => menu.description, :quantity => quantity, :price => menu.price)
		 @orderitem.save
		 
		 end
		 		 redirect_to(:action => :ordershow)

	end
	
	def ordershow
		@orders = Order.where(user_id: current_user.id)	
		@order = @orders.last
		@orderitems = @order.orderitems
	end
	def thanks
	
	end
  
end

