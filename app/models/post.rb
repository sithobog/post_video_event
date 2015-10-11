# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  slug       :string           not null
#  content    :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  tag_ids    :integer          default([]), is an Array
#

class Post < ActiveRecord::Base
  has_many :comments, :as => :target, dependent: :destroy
  has_one :picture, as: :assetable, dependent: :destroy

  accepts_nested_attributes_for :picture

  validates :title, :slug, :content, presence: true

  paginates_per 10
end
