class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :ideas

  def full_name
  	[name, surname].join(' ')
	end

	def full_name=(name)
	  elements = name.split(' ')
	  self.surname = elements.delete(elements.last)
	  self.name = elements.join(" ")
	end
end
