class SessionsController < ApplicationController
    def create
      @user = User.find_by(name: params[:name])
      if @user
        return head(:forbidden) unless @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to '/home'
      else
        redirect_to '/login'
      end
    end
  end