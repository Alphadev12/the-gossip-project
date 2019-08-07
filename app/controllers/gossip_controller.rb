class GossipController < ApplicationController
  def show
  	id = params['id']
  	@gossip = Gossip.find(id)
  end
end
