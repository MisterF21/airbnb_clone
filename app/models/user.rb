class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :email, :presence => true
  validates :encrypted_password, :presence => true

  has_many :listings

  after_create :send_signup_confirmation

  def send_signup_confirmation
    UserMailer.signup_confirmation(self).deliver
  end
end
