class Alerte < ActiveRecord::Base
  is_categorisable

  acts_as_indexed :fields => [:titre, :contenu]

  validates :titre, :presence => true, :uniqueness => true

  def self.recent
    order('date DESC').limit(5)
  end
end
