class Event < ActiveRecord::Base
  has_many :comments, :as => :target, dependent: :destroy
  validates :title, :address, :started_at, presence: true
end
