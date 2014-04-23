class Idea < ActiveRecord::Base
	belongs_to :user
	has_attached_file :image, styles: { 
		medium: "510x510>", 
		thumb: "210x210>" 
	}

	has_one :event_time

end
