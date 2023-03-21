require 'rails_helper'

RSpec.describe 'Home' do
  describe 'GET /' do

    subject(:get_index) { get '/' }

    it 'increments the view count' do
      view_count = ViewCount.find_or_create_by(path: '/')
      expect { get_index }.to change { view_count.reload.views }.from(0).to(1)
    end

    it 'block the row in table' do
      expect(ViewCount).to receive(:transaction).once
      get_index
    end
  end
end
