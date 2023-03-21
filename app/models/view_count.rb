class ViewCount < ApplicationRecord
  def self.increment(path)
    ViewCount.transaction do
      view_count = ViewCount.find_or_create_by(path: path)
      view_count.increment!(:views)
    end
  end
end
