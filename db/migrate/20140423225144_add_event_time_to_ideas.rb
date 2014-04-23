class AddEventTimeToIdeas < ActiveRecord::Migration
  def change
    add_column :ideas, :event_time, :datetime
  end
end
