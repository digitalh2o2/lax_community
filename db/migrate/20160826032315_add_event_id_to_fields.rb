class AddEventIdToFields < ActiveRecord::Migration
  def change
  	add_column :fields, :event_id, :integer
  end
end
