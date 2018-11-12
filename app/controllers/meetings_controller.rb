class MeetingsController < ApplicationController
  before_action :restrict_access

  def show
    @meeting = Meeting.find(params.require(:id))
  end

  def code
    send_data(RQRCode::QRCode.new({
      target: api_v1_scans_url,
      data: {
        user_id: current_user.id,
        meeting_id: params.require(:id)
      }
    }.to_json).as_png(
      fill: 'white',
      color: 'black',
      border_modules: 0,
    ), type: 'image/png', disposition: 'inline')
  end
end
