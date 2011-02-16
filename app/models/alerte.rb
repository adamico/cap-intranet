class Alerte < ActiveRecord::Base
  is_categorisable

  acts_as_indexed :fields => [:titre, :contenu]

  validates :titre, :presence => true, :uniqueness => true

  def self.recent
    order('date DESC').limit(5)
  end
end

# == Schema Information
#
# Table name: alertes
#
#  id         :integer         primary key
#  titre      :string(255)
#  date       :date
#  contenu    :text
#  position   :integer
#  created_at :timestamp
#  updated_at :timestamp
#

