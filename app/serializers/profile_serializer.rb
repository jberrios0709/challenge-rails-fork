class ProfileSerializer < ActiveModel::Serializer
  attributes :username

  has_many :repositories, as: :user, serializer: RepositorySerializer
end
