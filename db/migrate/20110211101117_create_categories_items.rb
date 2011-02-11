class CreateCategoriesItems < ActiveRecord::Migration
  def self.up
    create_table :categories_items do |t|
      t.references :item, :polymorphic => true
      t.references :categorie
    end
  end

  def self.down
    drop_table :categories_items
  end
end
