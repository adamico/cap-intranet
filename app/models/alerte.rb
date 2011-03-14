require 'stringex'
class Alerte < ActiveRecord::Base
  is_categorisable
  is_asciiable

  alias_attribute :title, :ascii_titre
  acts_as_indexed :fields => [:ascii_titre, :ascii_contenu]

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

