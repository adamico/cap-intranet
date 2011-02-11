class Event < ActiveRecord::Base
  is_categorisable

  has_event_calendar

  acts_as_indexed :fields => [:titre, :contenu]

  validates :titre, :presence => true, :uniqueness => true

  def self.next
    where(:start_at => Time.now..(Time.now.midnight + 7.days)).
      order('start_at ASC')
  end
end
