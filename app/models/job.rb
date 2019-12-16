class Job < ApplicationRecord
	has_many :jobs_users, dependent: :destroy
	scope :status_active, -> {where(status: 'oprec')}
end
