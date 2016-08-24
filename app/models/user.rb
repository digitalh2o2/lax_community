class User < ActiveRecord::Base
  has_many :comments
  has_many :events, through: :comments	
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true, length: {minimum: 3}
end
