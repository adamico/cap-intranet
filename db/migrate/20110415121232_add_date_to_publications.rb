class AddDateToPublications < ActiveRecord::Migration
  def self.up
    add_column :publications, :date, :date
  end

  def self.down
    remove_column :publications, :date
  end
end
