class Event < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	has_many :users, through: :comments
	has_many :fields
	accepts_nested_attributes_for :fields

	validates :name, presence: true
	validates :description, presence: true, length: { minimum: 5 }

	# def fields_attributes=(fields_attributes)
	# 	fields_attributes.each do |i, field_attributes|
	# 		self.fields.build(field_attributes)
	# 	end
	# end
end
