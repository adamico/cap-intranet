class CreateAlertes < ActiveRecord::Migration

  def self.up
    create_table :alertes do |t|
      t.string :titre
      t.date :date
      t.text :contenu
      t.integer :position

      t.timestamps
    end

    add_index :alertes, :id

    load(Rails.root.join('db', 'seeds', 'alertes.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "alertes"})

    Page.delete_all({:link_url => "/alertes"})

    drop_table :alertes
  end

end
