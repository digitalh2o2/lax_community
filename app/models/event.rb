class Event < ActiveRecord::Base
	has_many :comments
	has_many :users, through: :comments

	validates :name, presence: true
	validates :description, presence: true, length: { minimum: 20 }
end
