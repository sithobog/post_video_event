class Post < ActiveRecord::Base
  has_many :comments, :as => :target, dependent: :destroy
  validates :title, :slug, :content, presence: true
end
