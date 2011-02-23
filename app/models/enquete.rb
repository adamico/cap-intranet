#encoding: utf-8
class Enquete < ActiveRecord::Base
  is_categorisable

  acts_as_indexed :fields => [:titre, :contenu, :state]

  validates :titre, :presence => true, :uniqueness => true

  STATES = ["en cours", "terminee"]
  def self.en_cours
    where(:state => "en cours")
  end
  def self.with_state(state)
    where(:state => state)
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

