class DashboardController < ApplicationController
  def index
  end

  def search
    unfiltered_results = multisearch(params[:search])
    @documents = filter_private(unfiltered_results)
    render 'documents/index'
  end

  private

  def filter_private(search_results)
    search_results.reject { |result| result.private? && result.user != current_user }
  end
end
