class Event < ActiveRecord::Base
  has_many :comments, :as => :target, dependent: :destroy
  has_one :attachment, as: :assetable, dependent: :destroy
  accepts_nested_attributes_for :attachment
  validates :title, :address, :started_at, presence: true
end
