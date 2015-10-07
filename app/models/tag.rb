class Tag < ActiveRecord::Base
	validates :name, :slug , presence: true, uniqueness: true
end
