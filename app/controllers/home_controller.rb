require 'rqrcode'

class HomeController < ApplicationController
  def show
    if logged_in?
      # @meetings = Meeting.upcoming
      @meetings = Meeting.all
    end
  end
end
