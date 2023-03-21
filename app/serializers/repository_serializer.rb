class RepositorySerializer < ActiveModel::Serializer
  attributes :id, :name, :tags, :profile_id
end
