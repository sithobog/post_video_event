class Event < ActiveRecord::Base
	validates :title, :address, :started_at, presence: true
end
