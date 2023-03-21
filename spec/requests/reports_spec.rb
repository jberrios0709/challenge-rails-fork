require 'rails_helper'

RSpec.describe "Reports", type: :request do
  describe "GET /index" do
    context 'when you expect a json' do

      let(:profile) { create(:profile, username: 'jose-berrios') }
      let(:expected_data) do
        ProfileSerializer.new(profile).serializable_hash.as_json
      end

      before(:each) do

        create(:repository, name: 'test1', tags: 'mysql,aws,python', profile: profile)
        create(:repository, name: 'test2', tags: 'postgresql,redis,ror', profile: profile)
        get reports_path, headers: { 'accept': 'application/json'}
      end

      it 'return ok' do
        expect(response).to have_http_status :ok
      end

      it 'return correctly data' do
        expect(response.parsed_body.first).to eq expected_data
      end
    end
  end
end
