class Invite < ApplicationRecord
  belongs_to :group
  belongs_to :member

  scope :not_sent, -> { where(sent_at: nil) }
end
