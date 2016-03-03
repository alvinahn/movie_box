class Admin::UsersController < ApplicationController
  before_filter :admin_access

  def index
    @users = User.all
  end

end
