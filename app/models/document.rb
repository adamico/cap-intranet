require 'stringex'
class Document < ActiveRecord::Base

  alias_attribute :title, :ascii_titre
  acts_as_indexed :fields => [:ascii_titre, :ascii_contenu]

  validates :titre, :presence => true, :uniqueness => true

  belongs_to :source, :class_name => 'Resource'

  def self.recent
    order('created_at DESC').limit(5)
  end

  private

  def ascii_titre
    self.titre.to_ascii
  end
  def ascii_contenu
    self.contenu.to_ascii
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

