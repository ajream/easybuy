class HomeController < ApplicationController
  def index
    fetch_home_data
    
    @products = Product.onsale.page(params[:page] || 1).per_page(params[:per_page] || 12).order("id DESC").includes(:main_product_image)
  end
end
