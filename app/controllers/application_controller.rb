class ApplicationController < ActionController::Base
	# Token
	protect_from_forgery with: :exception
end
