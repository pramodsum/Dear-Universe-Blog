class VisitorsController < ApplicationController
  def index
    @posts = Post.includes(:comments).order("created_at DESC").limit(5)
  end
end
