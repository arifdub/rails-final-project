class OrderitemController < ApplicationController
  def index
	  @order = Orderitem.all
  end

  def show
  end

  def new
  end

  def edit
  end
end
