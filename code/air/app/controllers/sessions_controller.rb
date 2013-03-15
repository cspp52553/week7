class SessionsController < ApplicationController
  def new
  end

  def create
    data = request.env["omniauth.auth"]
    logger.info data['provider']
    logger.info data['uid']
    logger.info data['info']['nickname']

    user = User.find_by_name(data['info']['nickname'])
    if user.blank?
      user = User.create name: data['info']['nickname']
    end

    session[:user_id] = user.id
    redirect_to root_url
  end

  def destroy
    reset_session
    redirect_to root_url, notice: "See ya!"
  end
end





