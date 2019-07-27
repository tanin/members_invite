class Group < ApplicationRecord
  has_many :invites
  has_many :members

  validates :name, presence: true
end
