class Field < ActiveRecord::Base
	belongs_to :event

	#validates :name, uniqueness: true

end
