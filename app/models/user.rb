class User < ApplicationRecord
  attr_accessor :remember_token
  has_many :posts
  before_create :remember

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d]+\.[a-z]+\z/i.freeze

  validates :name, presence: true

  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  def self.digest(string)
    BCrypt::Password.create(string)
  end

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    self.remember_digest = User.digest(@remember_token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end
end
