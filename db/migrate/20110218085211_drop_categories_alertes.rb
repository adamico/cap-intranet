class DropCategoriesAlertes < ActiveRecord::Migration
  def self.up
    drop_table :categories_alertes
  end

  def self.down
    create_table "categories_alertes", :id => false do |t|
      t.references :categorie
      t.references :alerte
    end
  end
end
