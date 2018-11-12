module Api
  module V1
    class ScansController < BaseController
      before_action :restrict_access_api

      def create
        user_id = params.require(:user_id)
        meeting_id = params.require(:meeting_id)
        user = User.find(user_id)
        meeting = Meeting.find(meeting_id)

        already_checked_in = Attendence.find_by(user: user, meeting: meeting)

        if already_checked_in
          render status: :ok, json: { message: "Hey #{user.given_name}, you have already checked in." }
          return
        end

        attendence = Attendence.find_or_create_by!(user: user, meeting: meeting)

        render status: :ok, json: { message: "Welcome, #{user.given_name}! 👋" }
      end
    end
  end 
end