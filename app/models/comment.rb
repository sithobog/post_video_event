class Comment < ActiveRecord::Base
	belongs_to :target, :polymorphic => true
	validates :author_name, :content, presence: true
end
