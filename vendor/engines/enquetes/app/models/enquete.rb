class Enquete < ActiveRecord::Base

  acts_as_indexed :fields => [:titre, :contenu, :state]
  
  validates :titre, :presence => true, :uniqueness => true
  
end
