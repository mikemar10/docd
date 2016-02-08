class DashboardController < ApplicationController
  def index
  end

  def search
    @results = PgSearch.multisearch(params[:search]).map(&:searchable)
  end
end
