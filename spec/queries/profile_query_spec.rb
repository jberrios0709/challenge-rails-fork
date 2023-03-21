require 'rails_helper'

RSpec.describe ProfilesQuery do
  subject(:query) { described_class.new }

  context 'when filter by tag' do
    before(:each) do
      profile = create(:profile, username: 'jose-berrios')
      create(:repository, name: 'test1', tags: 'mysql,aws,python', profile: profile)
      create(:repository, name: 'test2', tags: 'postgresql,redis,ror', profile: profile)
      profile = create(:profile, username: 'alberto-galviz')
      create(:repository, name: 'app1', tags: 'php,js', profile: profile)
      create(:repository, name: 'app2', tags: 'postgresql,python', profile: profile)
    end

    it 'with 1 coincidence' do
      expect(query.filter_with_repositories_tags('php').call.count).to eq 1
    end

    it 'with 2 coincidence' do
      expect(query.filter_with_repositories_tags('postgresql').call.count).to eq 2
    end
  end
end