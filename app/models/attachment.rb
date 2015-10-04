class Attachment < Asset
	mount_uploader :data, AttachmentUploader, mount_on: :filename
end
