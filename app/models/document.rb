class Document < ActiveRecord::Base

  acts_as_indexed :fields => [:titre, :contenu]
  
  validates :titre, :presence => true, :uniqueness => true
  
  belongs_to :source, :class_name => 'Resource'
  scope :recent, order('created_at DESC').limit(5)
end
