# -*- coding: utf-8 -*-
class SessionsController < ApplicationController
  skip_before_filter :authorize

  def new
  end

  def create
    user = User.find_by_name(params[:name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to admin_url
    else
      redirect_to login_url, alert: "認証出来ませんでした。"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to store_url, notice: "ログアウト"
  end
end
