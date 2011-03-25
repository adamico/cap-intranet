class User < ActiveRecord::Base
  has_and_belongs_to_many :roles
  has_many :plugins, :class_name => "UserPlugin", :order => "position ASC", :dependent => :destroy
  has_friendly_id :username, :use_slug => true

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  # :login is a virtual attribute for authenticating by either username or email
  # This is in addition to a real persisted field like 'username'
  attr_accessor :login
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :plugins, :login

  validates :username, :presence => true, :uniqueness => true

  class << self
    # Find user by email or username.
    # https://github.com/plataformatec/devise/wiki/How-To:-Allow-users-to-sign_in-using-their-username-or-email-address
    def find_for_database_authentication(conditions)
      value = conditions[authentication_keys.first]
      where(["username = :value OR email = :value", { :value => value }]).first
    end
  end

  def plugins=(plugin_names)
    if persisted? # don't add plugins when the user_id is nil.
      UserPlugin.delete_all(:user_id => id)

      plugin_names.each_with_index do |plugin_name, index|
        plugins.create(:name => plugin_name, :position => index) if plugin_name.is_a?(String)
      end
    end
  end

  def authorized_plugins
    plugins.collect { |p| p.name } | Refinery::Plugins.always_allowed.names
  end

  def can_delete?(user_to_delete = self)
    user_to_delete.persisted? and
    !user_to_delete.has_role?(:superuser) and
    Role[:refinery].users.count > 1 and
    id != user_to_delete.id
  end

  def add_role(title)
    raise ArgumentException, "Role should be the title of the role not a role object." if title.is_a?(Role)
    roles << Role[title] unless has_role?(title)
  end

  def has_role?(title)
    raise ArgumentException, "Role should be the title of the role not a role object." if title.is_a?(Role)
    (role = Role.find_by_title(title.to_s.camelize)).present? and roles.collect{|r| r.id}.include?(role.id)
  end

end

# == Schema Information
# Schema version: 20110325094353
#
# Table name: users
#
#  id                   :integer         primary key
#  username             :string(255)     not null
#  email                :string(255)     not null
#  encrypted_password   :string(255)     not null
#  password_salt        :string(255)     not null
#  persistence_token    :string(255)
#  created_at           :timestamp
#  updated_at           :timestamp
#  perishable_token     :string(255)
#  current_sign_in_at   :timestamp
#  last_sign_in_at      :timestamp
#  current_sign_in_ip   :string(255)
#  last_sign_in_ip      :string(255)
#  sign_in_count        :integer
#  remember_token       :string(255)
#  reset_password_token :string(255)
#  remember_created_at  :timestamp
#

