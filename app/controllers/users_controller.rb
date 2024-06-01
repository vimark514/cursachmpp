class UsersController < ApplicationController
  before_action :check_user_id, only: [:show]

  def show
    @user = User.find(params[:id])
  end

  private

  def check_user_id
    redirect_to(authenticated_root_path, alert: 'Invalid User ID') unless params[:id].to_i > 0
  end
end
