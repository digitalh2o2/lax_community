class User < ActiveRecord::Base
  has_many :comments
  has_many :events, through: :comments	
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true, length: {minimum: 3}
  validates :username, uniqueness: true

  enum role: [:user, :admin]

  def full_name
  	self.first_name + " " + self.last_name
  end

end
