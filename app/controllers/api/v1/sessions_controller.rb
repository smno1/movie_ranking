class Api::V1::SessionsController < Api::V1::BaseController

  def create
    user_password=params[:session][:password]
    user_email=params[:session][:email]
    user= User.find_by(email: user_email) if user_email.present?
    if user.valid_password? user_password
      sign_in user, store: false
      user.generate_authentication_token!
      user.save
      render json: user, status: 200
    else
      render json: { errors: "Invalid email or password" }, status: 422
    end
  end

  def destroy
    user=current_user
    user.generate_authentication_token!
    user.save
    head 204
  end
end