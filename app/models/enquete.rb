class Enquete < ActiveRecord::Base
  is_asciiable
  is_categorisable

  alias_attribute :title, :ascii_titre
  acts_as_indexed :fields => [:ascii_titre, :ascii_contenu], :if => Proc.new {|enquete| enquete.state == "en cours"}

  validates :titre, :presence => true, :uniqueness => true

  STATES = ["en cours", "terminee"]

  default_scope order("publication DESC")
  def self.en_cours
    where(:state => "en cours")
  end
  def self.with_state(state)
    where(:state => state)
  end
end


# == Schema Information
# Schema version: 20110325094353
#
# Table name: enquetes
#
#  id          :integer         primary key
#  titre       :string(255)
#  publication :date
#  contenu     :text
#  state       :string(255)
#  position    :integer
#  created_at  :timestamp
#  updated_at  :timestamp
#

