class DashboardController < ApplicationController
  before_action :require_login

  def index
    most_used_tags = ActsAsTaggableOn::Tag.most_used(5)
    @shelves = most_used_tags.map { |tag| [ tag.name, filter_private(Document.tagged_with(tag.name)) ] }
  end

  def search
    unfiltered_results = multisearch(params[:search])
    @documents = filter_private(unfiltered_results)
  end

  private

  def filter_private(records)
    records.reject { |result| result.private? && result.user != current_user }
  end
end
