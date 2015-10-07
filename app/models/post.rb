class Post < ActiveRecord::Base
	include Taggable

  has_many :comments, :as => :target, dependent: :destroy
  has_one :picture, as: :assetable, dependent: :destroy

  accepts_nested_attributes_for :picture

  validates :title, :slug, :content, presence: true
end
