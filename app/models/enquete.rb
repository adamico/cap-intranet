#encoding: utf-8
require 'stringex'
class Enquete < ActiveRecord::Base
  is_categorisable

  alias_attribute :title, :ascii_titre
  acts_as_indexed :fields => [:ascii_titre, :ascii_contenu], :if => Proc.new {|enquete| enquete.state == "en cours"}

  validates :titre, :presence => true, :uniqueness => true

  STATES = ["en cours", "terminee"]
  def self.en_cours
    where(:state => "en cours")
  end
  def self.with_state(state)
    where(:state => state)
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
# Schema version: 20110223101349
#
# Table name: enquetes
#
#  id          :integer         not null, primary key
#  titre       :string(255)
#  publication :date
#  contenu     :text
#  state       :string(255)
#  position    :integer
#  created_at  :datetime
#  updated_at  :datetime
#

