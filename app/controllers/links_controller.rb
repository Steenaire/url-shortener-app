class LinksController < ApplicationController

  before_action :authenticate_user!

  def index
    @links = Link.where(user_id: current_user.id)
  end

  def show
    @link = Link.find_by(id: params[:id])
  end

  def new
  end

  def create
    link = Link.new(
      user_id: current_user.id,
      slug: params[:slug],
      target_url: params[:target_url]
      )
    link.standardize_target_url!

    if link.save
      flash[:success] = "URL Shortened!"
      redirect_to "/links"
    else
      flash[:danger] = "URL Not Shortened"
      render 'new'
    end
  end

end
