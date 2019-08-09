class CityController < ApplicationController
  def index
  end

  def show
    id = params[:id]
    @city = City.find(id)
    @users = @city.users
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
