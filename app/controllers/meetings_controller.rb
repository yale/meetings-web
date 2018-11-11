class MeetingsController < ApplicationController
  before_action :restrict_access

  def show
    @meeting = Meeting.find(params.require(:id))
    @qr = RQRCode::QRCode.new("#{current_user.id.to_s}:#{params.require(:id)}")
  end
end
