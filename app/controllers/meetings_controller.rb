class MeetingsController < ApplicationController
  before_action :restrict_access

  def show
    @meeting = Meeting.find(params.require(:id))
  end

  def code
    send_data(RQRCode::QRCode.new(new_attendence_url(id: params.require(:id), check_in: true)).as_png(
      fill: 'white',
      color: 'black',
      border_modules: 0,
    ), type: 'image/png', disposition: 'inline')
  end
end
