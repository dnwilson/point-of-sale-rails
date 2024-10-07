class ApplicationController < ActionController::Base
  # include Turbo::Native::Navigation

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern, unless: :turbo_native_app?

  # private

  # def hotwire_native_app?
  #   request.user_agent.to_s.match?(/(Turbo|Hotwire) Native/)
  # end
end
