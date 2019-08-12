class CommentsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
    gossip_id = params[:gossip_id]
    @gossip = Gossip.find(gossip_id)

    @anonyme = User.find(11)

    content = params[:comment_content]

    @comment = Comment.new(content: content)
    @comment.user = @anonyme
    @comment.gossip = @gossip

    if @comment.save
      redirect_to @gossip, :notice => "Un commentaire a été ajouter"
    else
      render "gossips/show"
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
