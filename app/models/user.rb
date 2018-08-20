class User < ActiveRecord::Base
  has_secure_password
  has_many :songs
  has_many :adds
  has_many :songs_added, through: :adds, source: :songs
  validates :first_name, :last_name, :email, presence: true
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, uniqueness: { case_sensitive: false }, format: {with: EMAIL_REGEX}
  validates :password, :presence => { :minimum => 8, :allow_nil => true }, :confirmation => true
end