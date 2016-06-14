class AdminController < ApplicationController

  layout 'admin'

  def index
    authenticate
    @posts = Post.all
    @authors = Author.all
  end
end
