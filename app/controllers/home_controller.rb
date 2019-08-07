class HomeController < ApplicationController
  def show
  	@users = User.all
  	@gossips = Gossip.all
  end
end
