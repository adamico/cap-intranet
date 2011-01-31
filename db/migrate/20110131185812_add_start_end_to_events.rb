class AddStartEndToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :start_at, :datetime
    add_column :events, :end_at, :datetime
    add_column :events, :all_day, :boolean
  end

  def self.down
    remove_column :events, :start_at
    remove_column :events, :end_at
    remove_column :events, :all_day
  end
end
