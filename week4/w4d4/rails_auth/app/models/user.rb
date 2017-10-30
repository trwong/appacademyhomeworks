class User < ApplicationRecord
  attr_reader :password


  validates :username, presence: true, uniqueness: true
  validates :session_token, presence: true, uniqueness: true
  validates :password_digest, presence: { message: "password_digest cannot be blank" }
  validates :password, length: { minimum: 6, allow_nil: true }
  before_validation :ensure_session_token


  def self.find_by_credentials(un, pw)
    User.find_by(username: un, password: pw)
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save
    self.session_token
  end

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

  def password=(pw)
    @password = pw
    self.password_digest = BCrypt::Password.create(pw)
  end
end
