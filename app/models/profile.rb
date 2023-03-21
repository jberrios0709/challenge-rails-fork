class Profile < ApplicationRecord
  validates :username,
            presence: true,
            uniqueness: true,
            format: {
              with: /\A[a-zA-Z0-9-]*\z/,
              message: 'may only contain alphanumeric characters and hyphens (-)'
            }

  has_many :repositories
end
