class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :noticias

  belongs_to :role

  validates_presence_of :username, :email, :password, :password_confirmation
  validates_uniqueness_of :username, :email
  validates_confirmation_of :password
end
