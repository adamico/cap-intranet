require 'stringex'
class Alerte < ActiveRecord::Base
  is_categorisable

  alias_attribute :title, :ascii_titre
  acts_as_indexed :fields => [:ascii_titre, :ascii_contenu]

  validates :titre, :presence => true, :uniqueness => true

  def self.recent
    order('date DESC').limit(5)
  end
  private

  def ascii_titre
    self.titre.to_ascii
  end
  def ascii_contenu
    self.contenu.to_ascii
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

