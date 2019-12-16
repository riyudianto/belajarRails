class JobsUser < ApplicationRecord
	before_create :default_status
	
	mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.
	validates :cover_letter, presence: true # Make sure the owner's name is present.
	def default_status
		self.status = "unread"
	end
end
