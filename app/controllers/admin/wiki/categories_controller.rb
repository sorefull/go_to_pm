class Admin::Wiki::CategoriesController < ApplicationController
  def new
    @category = Category.new(parent_id: params[:parent_id])
  end

  def create
    Category.create(categories_params)
    redirect_to wiki_categories_path
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])

    @category.update(categories_params)
    redirect_to wiki_categories_path
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to wiki_categories_path
  end

  private
  def categories_params
    params.require(:category).permit(:title, :parent_id)
  end
end
