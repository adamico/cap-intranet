class Categorie < ActiveRecord::Base
  # Associations
  has_and_belongs_to_many :alertes, :join_table => "categories_alertes"

end
