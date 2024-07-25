class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  def ping
    render plain: "All good!\n POST to /callback to see menu options", status: 200
  end
end
