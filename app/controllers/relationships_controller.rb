class RelationshipsController < ApplicationController

def create
  user = User.find(params[:id])
    current_user.follow(user)
  redirect_to request.referer
end

def destroy
  current_user.unfollow(params[:id])
  redirect_to request.referer
end


  private
  # def
  #   @user = User.find(params[:relationship][:follow_id])
  # end

end
