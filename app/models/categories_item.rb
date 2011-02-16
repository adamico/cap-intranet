class CategoriesItem < ActiveRecord::Base
  belongs_to :item, :polymorphic => true
  belongs_to :categorie
end

# == Schema Information
#
# Table name: categories_items
#
#  id           :integer         primary key
#  item_id      :integer
#  item_type    :string(255)
#  categorie_id :integer
#

