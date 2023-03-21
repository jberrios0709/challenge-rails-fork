class ProfilesQuery
  def initialize(profiles = Profile.all)
    @relation = profiles
  end

  def call
    @relation
  end

  def filter_with_repositories_tags(tag)
    if tag.present?
      @relation = @relation
                    .includes(:repositories)
                    .joins(:repositories)
                    .where("repositories.tags LIKE '%#{tag}%'")
    end
    self
  end
end