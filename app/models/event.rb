class Event < ActiveRecord::Base
  is_categorisable
  is_asciiable
  has_event_calendar

  alias_attribute :title, :ascii_titre
  acts_as_indexed :fields => [:ascii_titre, :ascii_contenu]

  validates :titre, :presence => true
  validates :start_at, :presence => true
  validates :end_at, :presence => true

  default_scope order("start_at DESC")

  def titre_with_date
    "#{self.titre} - #{self.start_at.to_date.strftime("%d/%m/%Y")}"
  end

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

