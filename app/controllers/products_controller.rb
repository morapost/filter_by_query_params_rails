class ProductsController < ApplicationController

  def index

  	@product_categories = Product.all.pluck(:category).uniq.sort
  	@product_brands = Product.all.pluck(:brand).uniq.sort
  	@products_size = Product.all.pluck(:size).uniq.sort

  	if params[:filter_type] == "price_lt_499"
  		@products = Product.where("price < ?",499 )
  		@total_worth = @products.total_worth
  	elsif params[:filter_type] == "price_upto_1200"
  		@products = Product.where("price between ? AND ?",0,1200)
  		@total_worth = @products.total_worth
  	elsif params[:filter_type] == "available"
  		@products = Product.where("availability = ?", true)
  		@total_worth = @products.total_worth
  	elsif params[:filter_type] && params[:filter_value]
  		@products = Product.where(params[:filter_type] => params[:filter_value])
  		@total_worth = @products.total_worth
  	else
  		@products = Product.all.order(name: :desc).limit(10)
  		@total_worth = Product.total_worth
  	end


  end



  def show
  end
end
