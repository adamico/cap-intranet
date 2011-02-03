class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate_user!
  helper "event_calendar/calendar"
end
