class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_save :downcase_email

  has_many :posts

  default_scope { order(created_at: :asc) }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PASSWORD_REGEX = /\A[A-Za-z\d]+\z/

  validates :email, uniqueness: { case_sensitive: false }, length: { maximum: 120 }, format: VALID_EMAIL_REGEX
  validates :password, length: { minimum: 8, maximum: 120 }, format: VALID_PASSWORD_REGEX
  validates :nickname, uniqueness: true, length: { maximum: 20 }
  validates :first_name, :last_name, length: { maximum: 40 }
  
  private

  def downcase_email
    self.email = email.downcase
  end

end
