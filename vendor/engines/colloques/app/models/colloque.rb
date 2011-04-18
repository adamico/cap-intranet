class Colloque < ActiveRecord::Base
  acts_as_indexed :fields => [:title, :contenu]

  validates :title, :presence => true, :uniqueness => true

  belongs_to :event

  def date
    if event
      self.event.start_at.to_date
    end
  end

  def self.same_year(instance)
    grouped_by_year[instance.date.beginning_of_year]
    .without_self(instance)
    .sort_by {|colloque| colloque.event.start_at}
  end

  def self.grouped_by_year
    array = all.group_by{|c| c.event.start_at.to_date.beginning_of_year}.sort{|x,y| y <=> x}
    hash = {}
    array.each do |year, colloques|
      hash[year] = colloques
    end
    hash
  end
end

# == Schema Information
# Schema version: 20110325094353
#
# Table name: colloques
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  contenu    :text
#  event_id   :integer
#  position   :integer
#  created_at :datetime
#  updated_at :datetime
#

