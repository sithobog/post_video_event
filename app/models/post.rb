class Post < ActiveRecord::Base
	validates :title, :slug, :content, presence: true
end
