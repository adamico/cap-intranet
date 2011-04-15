class CreatePublications < ActiveRecord::Migration

  def self.up
    create_table :publications do |t|
      t.string :title
      t.text :contenu
      t.integer :source_id
      t.integer :publication_category_id
      t.integer :position

      t.timestamps
    end

    add_index :publications, :id

    load(Rails.root.join('db', 'seeds', 'publications.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "publications"})

    Page.delete_all({:link_url => "/publications"})

    drop_table :publications
  end

end
