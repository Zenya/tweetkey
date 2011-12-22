class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :fetch_categories

  protected

  def fetch_categories
    @categories = Rails.cache.fetch('caterories', :expires_in => 10.minutes) do
      Category.all
    end
  end
end
