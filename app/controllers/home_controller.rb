require 'rqrcode'

class HomeController < ApplicationController
  def show
    if logged_in?
      @meetings = Meeting.upcoming
    end
  end
end
