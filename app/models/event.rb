class Event < ActiveRecord::Base
  is_categorisable
  has_event_calendar
  acts_as_indexed :fields => [:titre, :contenu]

  validates :titre, :presence => true, :uniqueness => true
  validates :start_at, :presence => true
  validates :end_at, :presence => true

  def self.next
    where(:start_at => Time.now..(Time.now.midnight + 7.days)).
      order('start_at ASC')
  end
end

# == Schema Information
#
# Table name: events
#
#  id         :integer         primary key
#  titre      :string(255)
#  date       :timestamp
#  contenu    :text
#  position   :integer
#  created_at :timestamp
#  updated_at :timestamp
#  start_at   :timestamp
#  end_at     :timestamp
#  all_day    :boolean
#

