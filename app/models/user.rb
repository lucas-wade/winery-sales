class User < ApplicationRecord
  include UserMailgun
  attr_accessor :remember_token, :activation_token, :reset_token
  has_many :winery_users, dependent: :destroy
  has_many :wineries, through: :winery_users

  before_save :downcase_email
  before_create :create_activation_digest
  #before_destroy :remove_winery_users
  validates :name, presence: true, length: {maximum: 50}
  validates :email, presence: true, length: {maximum: 255},
                  format: { with: $VALID_EMAIL_REGEX },
                  uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: {minimum: 6}, allow_nil: true

  self.per_page = 12

  #clean up urls
  # def to_param
  #  "#{id}-#{name.parameterize}"
  #end
  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end
  def forget
    update_attribute(:remember_digest, nil)
  end

  #def authenticated?(remember_token)
  #   return false if remember_digest.nil?
  #  BCrypt::Password.new(remember_digest).is_password?(remember_token)
  #end

  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

#USERS PERMISSIONS
  def activate
    update_attribute(:permissions,    3)
    update_attribute(:activated_at, Time.zone.now)
  end
  def active?
    return false unless permissions > 0
    true
  end
  def activated?
    return false unless permissions >= 3
    true
  end
  def winery_user?
    return false unless permissions >= 3
    true
  end
  def admin?
    return false unless permissions >= 10
    true
  end
  def root?
    return false unless permissions >= 11
    true
  end

  # Creates and assigns the activation token and digest.
  def create_activation_digest
    self.activation_token  = User.new_token
    self.activation_digest = User.digest(activation_token)
  end

  # Sets the password reset attributes.
  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest,  User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  # Returns true if a password reset has expired.
  def password_reset_expired?
    reset_sent_at < 3.hours.ago
  end

  private
    def downcase_email
      self.email = email.downcase
    end

    def remove_winery_users
      self.winery_users.destroy_all
    end

end
