class Attachment < Asset
	mount_uploader :data, PictureUploader, mount_on: :filename
end
