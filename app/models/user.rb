class User < ApplicationRecord
  has_many :registrations, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_events, through: :likes, source: :event 


  has_secure_password

  validates :name, presence: true

  validates :email, format: { with: /\S+@\S+/ }, presence: true, uniqueness: { case_sensitive: false }

  validates :password_confirmation, presence: true


end
