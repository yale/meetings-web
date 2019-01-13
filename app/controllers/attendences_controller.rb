class AttendencesController < ApplicationController
  before_action :restrict_access

  def new
    @meeting = Meeting.find(params.require(:id))
    @attendence = Attendence.new(meeting: @meeting)
  end

  def create
    @meeting = Meeting.find(params.require(:id))
    @attendence = Attendence.find_or_create_by!(meeting: @meeting, user: current_user)
    flash[:success] = "Checked in!"
    redirect_to @meeting
  end
end
