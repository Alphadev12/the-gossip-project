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

    # @anonyme = User.find(11)

    content = params[:comment_content]

    @comment = Comment.new(content: content)
    @comment.user = current_user
    @comment.gossip = @gossip

    if @comment.save
      redirect_to @gossip, :notice => "Un commentaire a été ajouter"
    else
      render "gossips/show"
    end
  end

  def edit
    comment_id = params[:id]
    @comment = Comment.find(comment_id)
  end

  def update
    comment_id = params[:id]
    @comment = Comment.find(comment_id)
    @gossip = @comment.gossip

    content = params[:comment_content]

    if @comment.update(content: content)
      puts "test"
      redirect_to @gossip, :notice => "Le commentaire a été bien modifier !"
    else
      render :edit
    end
  end

  def destroy
    id = params[:id]
    comment = Comment.find(id)
    gossip = comment.gossip

    comment.destroy
    redirect_to gossip, :alert => "Le commentaire a été bien supprimé !"
  end
end
