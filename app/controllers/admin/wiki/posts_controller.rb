class Admin::Wiki::PostsController < ApplicationController
  def new
    category = Category.find(params[:category_id])
    @post = category.posts.new
  end

  def create
    category = Category.find(params[:category_id])
    category.posts.create(posts_params)
    redirect_to wiki_categories_path
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    @post.update(posts_params)
    redirect_to wiki_categories_path
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to wiki_categories_path
  end

  private
  def posts_params
    params.require(:post).permit(:title, :body)
  end
end
