# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  name       :string
#  slug       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tag < ActiveRecord::Base
  validates :name, :slug , presence: true, uniqueness: true
  validates_format_of :slug, without: /[.]/, message: "can't include '.'"

  def to_param
    slug
  end
end
