require 'external/client'

class ReportService
  def generate
    external_client = ::External::Client.new
    profiles = external_client.fetch_profiles
    repositories = external_client.fetch_repositories
    repositories_group = repositories.group_by{ |e| e['profile_id'] }
    profiles.map do |profile|
      profile['repositories'] = repositories_group[profile['id']] || []
      profile
    end
  end
end
