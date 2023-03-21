class ReportsController < ApplicationController
  def index
    @profiles = fetch_profiles
    respond_to do |format|
      format.html
      format.json { render json: @profiles }
    end
  end

  def external
    @profiles = ReportService.new.generate
  end

  private

  def fetch_profiles
    temp = ProfilesQuery.new
    temp.filter_with_repositories_tags(params[:tag]) if params[:tag].present?

    parse_to_json(temp.call)
  end

  def parse_to_json(data)
    data.map do |element|
      ProfileSerializer.new(element).serializable_hash.with_indifferent_access
    end
  end
end
