require 'rails_helper'
require 'external/client'

RSpec.describe 'index reports', type: :system do
  context 'internal reports' do
    before(:each) do
      profile = create(:profile, username: 'jose-berrios')
      create(:repository, name: 'test1', tags: 'mysql,aws,python', profile: profile)
      create(:repository, name: 'test2', tags: 'postgresql,redis,ror', profile: profile)
      profile = create(:profile, username: 'alberto-galviz')
      create(:repository, name: 'app1', tags: 'php,js', profile: profile)
      create(:repository, name: 'app2', tags: 'postgresql,python', profile: profile)
    end

    it 'without tag' do
      visit reports_path

      expect(page.all("div.accordion-item").count).to eq(2)
      expect(page.all("li.list-group-item").count).to eq(4)
    end

    it 'with tag' do
      visit reports_path(tag: 'mysql')

      expect(page.all("div.accordion-item").count).to eq(1)
      expect(page.all("li.list-group-item").count).to eq(1)
    end
  end

  context 'external reports' do
    let(:profile_test) do
      JSON.parse(File.read('spec/fixtures/files/profiles.json'))
    end

    let(:repositories_test) do
      JSON.parse(File.read('spec/fixtures/files/repositories.json'))
    end

    before do
      allow_any_instance_of(External::Client).to receive(:fetch_profiles).and_return(profile_test)
      allow_any_instance_of(External::Client).to receive(:fetch_repositories).and_return(repositories_test)
    end

    it 'without tag' do
      visit reports_external_path

      expect(page.all("div.accordion-item").count).to eq(20)
      expect(page.all("li.list-group-item").count).to eq(38)
    end
  end
end