class Video < ActiveRecord::Base
	validates :title, :slug, :description, presence: true
end
