class GossipsController < ApplicationController
  def index
    @users = User.all
    @gossips = Gossip.all
  end

  def show
    id = params['id']
    @gossip = Gossip.find(id)
  end

  def new
  end

  def create
    title = params["title"]
    content = params["content"]

    gossip = Gossip.create(title: title, content: content)
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
