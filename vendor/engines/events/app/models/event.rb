class Event < ActiveRecord::Base
  is_categorisable
  is_asciiable

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

  def self.before(end_time)
    where("end_at < ?", Event.format_date(end_time))
  end
  def self.after(start_time)
    where("start_at > ?", Event.format_date(start_time))
  end

  # need to override the json view to return what full_calendar is expecting.
  # http://arshaw.com/fullcalendar/docs/event_data/Event_Object/
  def as_json(options = {})
    {
      :id => self.id,
      :title => self.titre,
      :description => self.contenu || "",
      :start => start_at.rfc822,
      :end => end_at.rfc822,
      :allDay => self.all_day,
      :recurring => false,
      :url => Rails.application.routes.url_helpers.event_path(id)
    }
  end

  def self.format_date(date_time)
    Time.at(date_time.to_i).to_formatted_s(:db)
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

