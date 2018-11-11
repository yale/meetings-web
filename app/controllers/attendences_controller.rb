class AttendencesController < ApplicationController
  def new
    @meeting = Meeting.find(params.require(:meeting_id))
  end

  def create
    @meeting = Meeting.find(params.require(:meeting_id))
  end
end
