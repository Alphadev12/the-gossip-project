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

    @user = User.find(11)

    @gossip = Gossip.new(title: title, content: content)
    @gossip.user = @user
    @gossip.save

    if @gossip.save
      redirect_to gossips_path, :notice => "The super potin was succesfully saved !"
    else
      render "new"
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
