module GossipsHelper
	def user_created_gossip?
    	@gossip.user == current_user ? true : false
  	end

  	# def user_created_comment?
   #  	comment.user == current_user ? true : false
  	# end
end
