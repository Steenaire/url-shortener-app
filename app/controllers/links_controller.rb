class LinksController < ApplicationController

  before_action :authenticate_user!

  def index
    @links = Link.where(user_id: current_user.id)
  end

  def show
    @link = Link.find_by(id: params[:id], user_id: current_user.id)

    unless @link
      flash[:warning] = "No such link"
      redirect_to "/links"
    end
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

  def destroy
    Link.find_by(id: params[:id]).destroy

    flash[:warning] = "Link Deleted!"

    redirect_to "/links"
  end

  def edit
    @link = Link.find_by(id: params[:id], user_id: current_user.id)

    unless @link
      flash[:warning] = "No such link"
      redirect_to "/links"
    end
  end

  def update
    @link = Link.find_by(id: params[:id])
    Link.update(@link.id, link_params)
    @link.standardize_target_url!
    if @link.save
      flash[:success] = "Link Updated!"
      redirect_to "/links/#{@link.id}"
    else
      render 'edit'
    end
  end

  private

    def link_params
      params.require(:link).permit(
        :slug,
        :target_url
        )
    end

end
