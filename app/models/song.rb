class Song < ActiveRecord::Base
  belongs_to :user
  has_many :adds
  has_many :users, through: :adds
  validates :title, :artist, presence: true
end
