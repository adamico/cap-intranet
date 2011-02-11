class CategoriesItem < ActiveRecord::Base
  belongs_to :item, :polymorphic => true
  belongs_to :categorie
end
