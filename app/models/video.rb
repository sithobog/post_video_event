class Video < ActiveRecord::Base
  has_many :comments, :as => :target, dependent: :destroy
  validates :title, :slug, :description, presence: true
end
