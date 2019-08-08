class GossipsController < ApplicationController
  def index
  end

  def show
    id = params['id']
    @gossip = Gossip.find(id)
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
