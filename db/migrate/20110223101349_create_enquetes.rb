class CreateEnquetes < ActiveRecord::Migration

  def self.up
    create_table :enquetes do |t|
      t.string :titre
      t.date :publication
      t.text :contenu
      t.string :state
      t.integer :position

      t.timestamps
    end

    add_index :enquetes, :id

    load(Rails.root.join('db', 'seeds', 'enquetes.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "enquetes"})

    Page.delete_all({:link_url => "/enquetes"})

    drop_table :enquetes
  end

end
