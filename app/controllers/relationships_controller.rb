class RelationshipsController < ApplicationController
  def follow
    current_user.follow(params[:id])
   redirect_to request.referer
  end
  
  def unfollow
    current_user.unfollow(params[:id])
    redirect_to request.referer
  end
  def follower
    user = User.find_by(id: params[:id])
    @users = user.following_user
  end
  def followed
    user = User.find_by(id: params[:id])
  end
end
