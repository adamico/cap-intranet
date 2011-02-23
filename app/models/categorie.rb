class Categorie < ActiveRecord::Base
  has_many_polymorphs :items, :from => [:alertes, :events, :enquetes]
end

# == Schema Information
#
# Table name: categories
#
#  id         :integer         primary key
#  name       :string(255)
#  created_at :timestamp
#  updated_at :timestamp
#

