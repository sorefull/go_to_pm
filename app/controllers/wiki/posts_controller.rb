class Wiki::PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    render 'show', layout: false
  end
end
