class Categorie < ActiveRecord::Base
  # Associations
  #has_and_belongs_to_many :alertes, :join_table => "categories_alertes"
  has_many_polymorphs :items, :from => [:alertes, :events]

end
