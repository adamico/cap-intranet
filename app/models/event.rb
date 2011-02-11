class Event < ActiveRecord::Base

  has_event_calendar

  acts_as_indexed :fields => [:titre, :contenu]

  validates :titre, :presence => true, :uniqueness => true

  scope :next, order('start_at ASC').
    where(:start_at => Time.now..(Time.now.midnight + 7.days))
end
