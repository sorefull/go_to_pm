class Wiki::CategoriesController < ApplicationController
  def index
    @categories = Category.roots
  end
end
