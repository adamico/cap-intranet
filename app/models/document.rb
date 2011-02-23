class Document < ActiveRecord::Base
  acts_as_indexed :fields => [:titre, :contenu]

  validates :titre, :presence => true, :uniqueness => true

  belongs_to :source, :class_name => 'Resource'

  def self.recent
    order('created_at DESC').limit(5)
  end
end

# == Schema Information
#
# Table name: documents
#
#  id         :integer         primary key
#  titre      :string(255)
#  source_id  :integer
#  contenu    :text
#  position   :integer
#  created_at :timestamp
#  updated_at :timestamp
#

