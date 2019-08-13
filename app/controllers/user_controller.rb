class UserController < ApplicationController
  def index
  end

  def show
    id = params["id"]
  	@user = User.find(id)
  end

  def new
  end

  def create
    first_name = params['first_name']
    last_name = params['last_name']
    age = params['age']
    email = params['email']
    description = params['description']

    city_id = params['post']['city_id']

    password = params['password']
    password_confirm = params['password_confirm']

    user = User.new(first_name: first_name, last_name: last_name, age: age, email: email, description: description, password: password, password_confirmation: password_confirm)
    city = City.find(city_id)

    user.city = city
    if user.authenticate(password_confirm)
      if user.save
        log_in(user)
        redirect_to gossips_path
      end
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
