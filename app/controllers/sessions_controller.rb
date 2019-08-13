class SessionsController < ApplicationController
  def new
  end

  def create
  	email = params['email']
  	password = params['password']
  	user = User.find_by(email: email)

  	if user && user.authenticate(password)
  		log_in(user)

  		redirect_to gossips_path
  	else
  		flash.now[:danger] = 'Adresse email/mot de passe incorrect'
  		render 'new'
  	end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
end
