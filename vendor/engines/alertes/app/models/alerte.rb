class Alerte < ActiveRecord::Base

  acts_as_indexed :fields => [:titre, :contenu]
  
  validates :titre, :presence => true, :uniqueness => true
  
end
