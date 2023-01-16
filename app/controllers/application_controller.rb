class ApplicationController < ActionController::API
    include JsonWebToken
    before_action :authenticate_request

  private

  def authenticate_request
    header = request.headers["Authorization"]
    header = header.split(" ").last if header
    decoded = jwt_decode(header)
    @current_user = User.find(decoded[:user_id])
  end

  def check_moderators
    if @current_user.moderator == false
      render json: "You are not authorized.", status: :unprocessable_entity
    else
    end
     end

     



end
