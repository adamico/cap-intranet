class Publication < ActiveRecord::Base
  is_asciiable

  alias_attribute :title, :ascii_titre

  acts_as_indexed :fields => [:ascii_titre, :ascii_contenu]

  belongs_to :source, :class_name => 'Resource'
  validates :titre, :presence => true, :uniqueness => true

  default_scope order("date DESC")

  def self.recent
    limit(5)
  end

  def self.with_publication_category(publication_category)
    where(:publication_category => publication_category)
  end
end
