class CreatePublications < ActiveRecord::Migration

  def self.up
    create_table :publications do |t|
      t.string :titre
      t.text :contenu
      t.integer :source_id
      t.string :publication_category
      t.integer :position

      t.timestamps
    end

    add_index :publications, :id

    say_with_time('loading publications seeds') do
      load(Rails.root.join('db', 'seeds', 'publications.rb'))
    end
  end

  def self.down
    UserPlugin.destroy_all({:name => "publications"})

    Page.delete_all({:link_url => "/publications"})

    drop_table :publications
  end

end
