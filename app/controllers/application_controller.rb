class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def getKeyApp
  	return "36403e55692f756f5c2f5b5263654f5b7a2034614b2a67317d5b48283b"
  end

  def checkKeyApp( key_app )
		if key_app == getKeyApp 
			true
		else 
			false
		end
	end
end
