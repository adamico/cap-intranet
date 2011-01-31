class Alerte < ActiveRecord::Base

  acts_as_indexed :fields => [:titre, :contenu]
  
  validates :titre, :presence => true, :uniqueness => true
  
  has_and_belongs_to_many :categories, :join_table => "categories_alertes"

  scope :recent, order('date DESC').limit(5)

  scope :with_categorie, lambda {|cat| joins(:categories).where(:categories => {:name => cat}) }
end
