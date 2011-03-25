class Colloque < ActiveRecord::Base
  acts_as_indexed :fields => [:title, :contenu]

  validates :title, :presence => true, :uniqueness => true

  belongs_to :event
end

# == Schema Information
# Schema version: 20110325094353
#
# Table name: colloques
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  contenu    :text
#  event_id   :integer
#  position   :integer
#  created_at :datetime
#  updated_at :datetime
#

