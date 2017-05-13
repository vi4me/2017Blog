class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
		 :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  has_attached_file :avatar, styles: { medium: '300x300>', thumb: '25x25>' }, default_url: '/images/:style/missing.png'
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/  
  
  belongs_to :role
  has_many :role_settings, through: :role
  has_many :comments, dependent: :destroy
  has_many :commented_articles, through: :comments,
           source: :articles
  has_many :auth_providers, dependent: :destroy

  before_validation do
    if self.password.blank?
      self.password = Devise.friendly_token
    end
  end


  def full_name
	"#{first_name} #{last_name}"
  end 

  def full_name=(value)
    first_last_name = value.split(' ')
    self.first_name = first_last_name[0]
    self.last_name = first_last_name[1]
  end      
end
