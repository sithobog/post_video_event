# == Schema Information
#
# Table name: videos
#
#  id          :integer          not null, primary key
#  title       :string           not null
#  slug        :string           not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  tag_ids     :integer          default([]), is an Array
#

class Video < ActiveRecord::Base
  has_many :comments, :as => :target, dependent: :destroy

  validates :title, :slug, :description, presence: true

  paginates_per 10
end
