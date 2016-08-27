class User < ActiveRecord::Base
  has_many :comments
  has_many :events, through: :comments	
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  validates :username, presence: true
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
  		full_name = auth.info.name.split		
  		user.first_name = full_name.first
  		user.last_name = full_name.last
  		user.username = auth.info.username
  		user.password = Devise.friendly_token[0,20]
  		user.password_confirmation = user.password
  		user.save
  	end
  end


end
