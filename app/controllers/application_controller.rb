class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate_user!
  helper "event_calendar/calendar"
  helper "refinery/helpers/meta"
  helper "refinery/helpers/head"
  helper "refinery/helpers/menu"
  helper_method :refinery_user?
end
