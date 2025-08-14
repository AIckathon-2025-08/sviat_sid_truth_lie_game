class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  
  before_action :cleanup_old_games
  
  private
  
  def cleanup_old_games
    # Clean up games older than 24 hours (only in production to avoid performance impact)
    if Rails.env.production?
      GameStore.cleanup_old_games
    end
  end
end
