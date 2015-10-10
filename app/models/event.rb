# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  address    :text             not null
#  started_at :datetime         not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  tag_ids    :integer          default([]), is an Array
#

class Event < ActiveRecord::Base
  has_many :comments, :as => :target, dependent: :destroy
  has_one :attachment, as: :assetable, dependent: :destroy
  accepts_nested_attributes_for :attachment
  validates :title, :address, :started_at, presence: true
end
