class DropSeoMeta < ActiveRecord::Migration
  def self.up
    drop_table :seo_meta if self.table_exists?("seo_meta")
  end

  def self.down
  end
end
