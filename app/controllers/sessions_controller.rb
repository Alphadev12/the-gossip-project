class SessionsController < ApplicationController
  def new
  end

  def create
  	email = params['email']
  	password = params['password']
  	user = User.find_by(email: email)

  	if user && user.authenticate(password)
  		session[:user_id] = user.id
  		redirect_to gossips_path
  	else
  		flash.now[:danger] = 'Adresse email/mot de passe incorrect'
  		render 'new'
  	end
  end

  def detroy
  end
end
