class Colloque < ActiveRecord::Base
  is_asciiable

  alias_attribute :title, :ascii_title
  acts_as_indexed :fields => [:ascii_title, :ascii_contenu]

  validates :title, :presence => true, :uniqueness => true

  # associations
  has_many :resources

end
