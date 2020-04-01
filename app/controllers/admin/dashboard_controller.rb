class Admin::DashboardController < ApplicationController
  def show
    @ProductsCount = Product.all.count
    @CategoriesCount = Category.all.count
  end
end
