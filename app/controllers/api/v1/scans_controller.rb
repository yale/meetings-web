module Api
  module V1
    class ScansController < BaseController
      before_action :restrict_access_api

      def create
        data = params.require(:data)
        user_id, meeting_id = data.split(':')
        user = User.find(user_id)
        meeting = Meeting.find(meeting_id)

        attendence = Attendence.find_or_create_by!(user: user, meeting: meeting)
        render status: :ok, json: { message: "Welcome, #{user.name}!" }
      end
    end
  end 
end