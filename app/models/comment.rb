# == Schema Information
#
# Table name: comments
#
#  id          :integer          not null, primary key
#  author_name :string           not null
#  content     :text             not null
#  target_id   :integer
#  target_type :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Comment < ActiveRecord::Base
  belongs_to :target, :polymorphic => true, touch: true
  validates :author_name, :content, presence: true
end
