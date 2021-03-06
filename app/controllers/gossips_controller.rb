class GossipsController < ApplicationController
  before_action :authenticate_user, except: :index

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

    # @user = User.find(11)
    @user = User.find_by(id: session[:user_id])


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
    id = params[:id]
    @gossip = Gossip.find(id)
  end

  def update
    id = params[:id]
    @gossip = Gossip.find(id)
    
    title = params["title"]
    content = params["content"]

    if @gossip.update(title: title, content: content)
      redirect_to @gossip, :notice => "The super potin was succesfully updated !"
    else
      render :edit
    end

  end

  def destroy
    id = params[:id]
    gossip = Gossip.find(id)
    gossip.destroy

    redirect_to gossips_path, :notice => "The super potin was succesfully delete !"
  end

  def authenticate_user
    unless current_user
      flash[:danger] = "Veuillez vous connecté"
      redirect_to new_session_path
    end
  end

end
