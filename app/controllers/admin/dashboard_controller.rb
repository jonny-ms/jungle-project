class Admin::DashboardController < ApplicationController

  http_basic_authenticate_with name: ENV['HTTP_BASIC_AUTH_USERNAME'], password: ENV['HTTP_BASIC_AUTH_PASSWORD']

  def show
    @products = Product.count
    @categories = Category.count
    puts @categories
  end
end
