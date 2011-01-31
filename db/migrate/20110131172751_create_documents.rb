class CreateDocuments < ActiveRecord::Migration

  def self.up
    create_table :documents do |t|
      t.string :titre
      t.integer :source_id
      t.text :contenu
      t.integer :position

      t.timestamps
    end

    add_index :documents, :id

    load(Rails.root.join('db', 'seeds', 'documents.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "documents"})

    Page.delete_all({:link_url => "/documents"})

    drop_table :documents
  end

end
