class Admin::UsersController < ApplicationController
  before_filter :admin_access

  def index
    @users = User.all.page(params[:page]).per(10)
  end

end
