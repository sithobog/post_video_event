# == Schema Information
#
# Table name: assets
#
#  id             :integer          not null, primary key
#  filename       :text             not null
#  type           :string(30)
#  assetable_id   :integer
#  assetable_type :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Attachment < Asset
  mount_uploader :data, AttachmentUploader, mount_on: :filename
end
