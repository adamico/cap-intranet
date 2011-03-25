class CreateColloques < ActiveRecord::Migration

  def self.up
    create_table :colloques do |t|
      t.string :title
      t.text :contenu
      t.references :event
      t.integer :position

      t.timestamps
    end

    add_index :colloques, :id

    load(Rails.root.join('db', 'seeds', 'colloques.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "colloques"})

    Page.delete_all({:link_url => "/colloques"})

    drop_table :colloques
  end

end
