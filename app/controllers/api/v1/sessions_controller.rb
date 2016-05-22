class Api::V1::SessionsController < Api::V1::BaseController

  def create
    user_password=params[:session][:password]
    user_email=params[:session][:email]
    user= User.find_by(email: user_email) if user_email.present?
    if user.nil?
        render json: { errors: "this email doesn't register"}, status: 422
        return
    end
    if user.valid_password? user_password
      sign_in user, store: false
      user.generate_authentication_token!
      user.save
      render json: user.to_json(:include=>[{:default_cinema=>{:only=>:name}}, 
              {:default_cinema_screen=>{:only=>[:number, :id]}}]), status: 200
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
