class Users::SessionsController < Devise::SessionsController
  def destroy
    # Add your sign-out logic here
    sign_out(current_user)
    redirect_to unauthenticated_root, notice: 'You have been signed out.'
  end
end
