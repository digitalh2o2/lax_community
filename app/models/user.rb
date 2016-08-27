class User < ActiveRecord::Base
  has_many :comments
  has_many :events, through: :comments	
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  validates :username, presence: true, length: {minimum: 3}
  validates :username, uniqueness: true

  enum role: [:user, :admin]

  def full_name
  	self.first_name + " " + self.last_name
  end

  def self.from_omniauth(auth)
  	where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
  		user.provider = auth.provider
  		user.uid = auth.uid
  		user.email = auth.info.email
  		user.password = Devise.friendly_token[0,20]
  		user.first_name = auth.info.first_name
  		user.last_name = auth.info.last_name
  		user.username = auth.info.username
  	end
  end


end
