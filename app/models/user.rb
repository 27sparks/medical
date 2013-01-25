class User < ActiveRecord::Base
  attr_accessible :email, :name, :role, :password, :password_confirmation
  has_secure_password
  has_many :pains

  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token
  before_save :set_role

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: { minimum: 6 }
  validates_confirmation_of :password
  validates :password_confirmation, presence: true

  def admin?
    self.role == :admin
  end

  def member?
    self.role == :member
  end

  private
    def set_role
      self.role ||= self.role = "member"
    end

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end

end
