module Api
  module V1
    class BaseController < ApplicationController
      skip_before_action :verify_authenticity_token

      def restrict_access_api
        authenticate_with_http_token do |token, options|
          @current_user = User.find_by(api_key: token)
        end
      end
    end
  end
end