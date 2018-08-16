class ProductsController < ApplicationController

  def index

  	@product_categories = Product.all.pluck(:category).uniq.sort
  	@product_brands = Product.all.pluck(:brand).uniq.sort
  	@products_size = Product.all.pluck(:size).uniq.sort

  	if params[:filter_type] == "price_lt_499"
  		@products = Product.where("price < ?",499 )
  	elsif params[:filter_type] == "price_upto_1200"
  		@products = Product.where("price between ? AND ?",0,1200)
  	elsif params[:filter_type] == "available"
  		@products = Product.where("availability = ?", true)
  	elsif params[:filter_type] && params[:filter_value]
  		@products = Product.where(params[:filter_type] => params[:filter_value])
  	else
  		@products = Product.all.order(name: :desc).limit(10)
  	end
  end

  def show
  end
end
