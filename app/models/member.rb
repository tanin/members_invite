class Member < ApplicationRecord
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :name, presence: true

  has_many :invites
  belongs_to :group, optional: true

  paginates_per 100
end
