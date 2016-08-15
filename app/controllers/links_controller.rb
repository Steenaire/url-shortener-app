class LinksController < ApplicationController

  before_action :authenticate_user!

  def index
    @links = Link.find_by(user_id: current_user.id)
  end

end
