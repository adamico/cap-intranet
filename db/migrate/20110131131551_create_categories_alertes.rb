class CreateCategoriesAlertes < ActiveRecord::Migration
  def self.up
    create_table "categories_alertes", :id => false do |t|
      t.references :categorie
      t.references :alerte
    end
  end

  def self.down
    drop_table :categories_alertes
  end
end
