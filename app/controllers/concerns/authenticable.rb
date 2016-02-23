module Authenticable
    #override Devise current_user
    def current_user
      @current_user ||= User.find_by(auth_token: request.headers['Authorization'])
    end

    def authenticate_with_token!
      render json: {errors: "not authenticated"}, status: :unauthorized unless current_user.present?
    end
end